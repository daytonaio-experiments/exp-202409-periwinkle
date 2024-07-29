from django.contrib.auth import authenticate, update_session_auth_hash
from django.contrib.auth.models import User
from django.shortcuts import render
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
import json

@csrf_exempt
def change_password(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        user = request.user

        current_password = data.get('current_password')
        new_password = data.get('new_password')
        confirm_password = data.get('confirm_password')

        if not user.check_password(current_password):
            return JsonResponse({'error': 'Current password is incorrect.'}, status=400)

        if new_password != confirm_password:
            return JsonResponse({'error': 'Passwords do not match.'}, status=400)

        if not new_password:
            return JsonResponse({'error': 'New password is required.'}, status=400)

        if not confirm_password:
            return JsonResponse({'error': 'Confirmation password is required.'}, status=400)

        # Here you can add additional password validation logic if needed
        if len(new_password) < 8:
            return JsonResponse({'error': 'New password does not meet security requirements.'}, status=400)

        user.set_password(new_password)
        user.save()
        update_session_auth_hash(request, user)  # Important to keep the user logged in

        return JsonResponse({'message': 'Password updated successfully.'})

    return JsonResponse({'error': 'Invalid request method.'}, status=405)