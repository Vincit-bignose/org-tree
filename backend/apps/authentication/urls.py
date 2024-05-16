from apps.authentication.views import CookieTokenRefreshView, CookieTokenObtainPairView
from django.urls import path

urlpatterns = [
    path("token/", CookieTokenObtainPairView.as_view(), name="token_obtain_pair"),
    path("token/refresh/", CookieTokenRefreshView.as_view(), name="token_refresh"),
]
