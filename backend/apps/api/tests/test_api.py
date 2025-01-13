import pytest
from django.urls import reverse
from rest_framework import status
from rest_framework.test import APIClient
from django.contrib.auth import get_user_model

User = get_user_model()

@pytest.fixture
def api_client():
    return APIClient()

@pytest.fixture
def admin_user():
    return User.objects.create_user(
        username='admin',
        email='admin@example.com',
        password='adminpass123',
        is_admin=True
    )

@pytest.fixture
def normal_user():
    return User.objects.create_user(
        username='normal',
        email='normal@example.com',
        password='normalpass123'
    )

@pytest.mark.django_db
class TestUserAPI:
    def test_user_list_admin_only(self, api_client, admin_user, normal_user):
        # Login as admin
        api_client.force_authenticate(user=admin_user)
        response = api_client.get(reverse('user-list'))
        assert response.status_code == status.HTTP_200_OK
        
        # Login as normal user
        api_client.force_authenticate(user=normal_user)
        response = api_client.get(reverse('user-list'))
        assert response.status_code == status.HTTP_403_FORBIDDEN

    def test_user_detail_owner_or_admin(self, api_client, admin_user, normal_user):
        # Admin can access any user
        api_client.force_authenticate(user=admin_user)
        response = api_client.get(reverse('user-detail', args=[normal_user.id]))
        assert response.status_code == status.HTTP_200_OK

        # User can access own profile
        api_client.force_authenticate(user=normal_user)
        response = api_client.get(reverse('user-detail', args=[normal_user.id]))
        assert response.status_code == status.HTTP_200_OK

        # User cannot access other profiles
        other_user = User.objects.create_user(
            username='other',
            email='other@example.com',
            password='otherpass123'
        )
        response = api_client.get(reverse('user-detail', args=[other_user.id]))
        assert response.status_code == status.HTTP_403_FORBIDDEN

    def test_me_endpoint(self, api_client, normal_user):
        api_client.force_authenticate(user=normal_user)
        response = api_client.get(reverse('user-me'))
        assert response.status_code == status.HTTP_200_OK
        assert response.data['email'] == normal_user.email

    def test_update_profile(self, api_client, normal_user):
        api_client.force_authenticate(user=normal_user)
        data = {
            'bio': 'Updated bio',
            'website_url': 'https://example.com'
        }
        response = api_client.patch(reverse('user-update-profile'), data)
        assert response.status_code == status.HTTP_200_OK
        assert response.data['bio'] == data['bio']
        assert response.data['website_url'] == data['website_url']

    def test_rate_limiting(self, api_client, normal_user):
        api_client.force_authenticate(user=normal_user)
        url = reverse('user-me')
        
        # Make 100 requests (should succeed)
        for _ in range(100):
            response = api_client.get(url)
            assert response.status_code == status.HTTP_200_OK
        
        # 101st request should fail
        response = api_client.get(url)
        assert response.status_code == status.HTTP_429_TOO_MANY_REQUESTS