from django.http import JsonResponse
from rest_framework import status
from rest_framework_simplejwt.tokens import AccessToken
from django.conf import settings
import time

class RateLimitMiddleware:
    def __init__(self, get_response):
        self.get_response = get_response
        self.rate_limits = {}

    def __call__(self, request):
        if hasattr(request, 'user') and request.user.is_authenticated:
            user_id = str(request.user.id)
            current_time = time.time()
            
            # Clean up old entries
            self.rate_limits = {
                k: v for k, v in self.rate_limits.items()
                if current_time - v['timestamp'] < 3600  # 1 hour window
            }
            
            if user_id in self.rate_limits:
                if self.rate_limits[user_id]['count'] >= 100:  # 100 requests per hour
                    return JsonResponse(
                        {'error': 'Rate limit exceeded'},
                        status=status.HTTP_429_TOO_MANY_REQUESTS
                    )
                self.rate_limits[user_id]['count'] += 1
            else:
                self.rate_limits[user_id] = {
                    'count': 1,
                    'timestamp': current_time
                }
        
        response = self.get_response(request)
        return response

class SecurityHeadersMiddleware:
    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        response = self.get_response(request)
        
        # Security headers
        response['X-Content-Type-Options'] = 'nosniff'
        response['X-Frame-Options'] = 'DENY'
        response['X-XSS-Protection'] = '1; mode=block'
        response['Strict-Transport-Security'] = 'max-age=31536000; includeSubDomains'
        response['Content-Security-Policy'] = "default-src 'self'"
        
        return response