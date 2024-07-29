# views.py
from django.contrib.auth.decorators import login_required
from django.http import JsonResponse
from django.views.decorators.http import require_http_methods
from .models import UserProfile

@login_required
@require_http_methods(["GET"])
def get_background_color(request):
    profile, created = UserProfile.objects.get_or_create(user=request.user)
    return JsonResponse({'background_color': profile.background_color})

@login_required
@require_http_methods(["POST"])
def set_background_color(request):
    profile, created = UserProfile.objects.get_or_create(user=request.user)
    new_color = request.POST.get('color')
    if new_color in ['light', 'dark']:
        profile.background_color = new_color
        profile.save()
        return JsonResponse({'status': 'success'})
    else:
        return JsonResponse({'status': 'error', 'message': 'Invalid color'}, status=400)