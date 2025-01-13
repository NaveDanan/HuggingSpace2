from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import UserViewSet, home

router = DefaultRouter()
router.register(r'users', UserViewSet)

urlpatterns = [
    path('', home, name='home'),  # Reference the home view function
    path('auth/', include('apps.users.urls')),
    path('', include(router.urls)),
]