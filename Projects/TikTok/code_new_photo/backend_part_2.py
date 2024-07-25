from django.shortcuts import render, get_object_or_404
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from django.core.files.storage import default_storage
from django.core.files.base import ContentFile
from .models import UserProfile
import os

@csrf_exempt
def change_profile_photo(request):
    if request.method == 'POST':
        user = request.user
        user_profile = get_object_or_404(UserProfile, user=user)
        
        if 'profile_photo' not in request.FILES:
            return JsonResponse({'error': 'No photo selected'}, status=400)
        
        profile_photo = request.FILES['profile_photo']
        
        try:
            # Save the new profile photo
            path = default_storage.save('profile_photos/' + profile_photo.name, ContentFile(profile_photo.read()))
            user_profile.profile_photo = path
            user_profile.save()
            return JsonResponse({'success': 'Profile photo updated successfully'}, status=200)
        except Exception as e:
            return JsonResponse({'error': str(e)}, status=500)
    return JsonResponse({'error': 'Invalid request method'}, status=405)