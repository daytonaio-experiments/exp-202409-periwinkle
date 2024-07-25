from django.urls import path
from .views import change_profile_photo

urlpatterns = [
    path('change-profile-photo/', change_profile_photo, name='change_profile_photo'),
]