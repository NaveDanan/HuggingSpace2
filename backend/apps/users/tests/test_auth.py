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
def test_user():
    return User.objects.create_user(
        username='testuser',
        email='test@example.com',
        password='testpass123'
    )

@pytest.mark.django_db
class TestAuthentication:
    def test_user_registration(self, api_client):
        url = reverse('register')
        data = {
            'username': 'newuser',
            'email': 'newuser@example.com',
            'password': 'newpass123',
            'password2': 'newpass123'
        }
        response = api_client.post(url, data)
        assert response.status_code == status.HTTP_201_CREATED
        assert User.objects.filter(email='newuser@example.com').exists()

    def test_user_login(self, api_client, test_user):
        url = reverse('login')
        data = {
            'email': 'test@example.com',
            'password': 'testpass123'
        }
        response = api_client.post(url, data)
        assert response.status_code == status.HTTP_200_OK
        assert 'access' in response.data
        assert 'refresh' in response.data
        assert 'user' in response.data

    def test_user_logout(self, api_client, test_user):
        # First login to get token
        login_url = reverse('login')
        login_data = {
            'email': 'test@example.com',
            'password': 'testpass123'
        }
        login_response = api_client.post(login_url, login_data)
        
        # Then logout
        url = reverse('logout')
        api_client.credentials(HTTP_AUTHORIZATION=f"Bearer {login_response.data['access']}")
        data = {'refresh_token': login_response.data['refresh']}
        response = api_client.post(url, data)
        assert response.status_code == status.HTTP_205_RESET_CONTENT

    def test_password_reset_request(self, api_client, test_user):
        url = reverse('password_reset')
        data = {'email': 'test@example.com'}
        response = api_client.post(url, data)
        assert response.status_code == status.HTTP_200_OK

    def test_invalid_login(self, api_client):
        url = reverse('login')
        data = {
            'email': 'wrong@example.com',
            'password': 'wrongpass'
        }
        response = api_client.post(url, data)
        assert response.status_code == status.HTTP_401_UNAUTHORIZED