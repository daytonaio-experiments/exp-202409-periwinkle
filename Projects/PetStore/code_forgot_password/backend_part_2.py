from django.shortcuts import render, redirect
   from django.contrib.auth.models import User
   from django.core.mail import send_mail
   from django.utils.crypto import get_random_string
   from .models import PasswordRecoveryRequest

   def login_page(request):
       return render(request, 'login.html')

   def password_recovery_page(request):
       return render(request, 'password_recovery.html')

   def submit_recovery_form(request):
       email = request.POST['email']
       try:
           user = User.objects.get(email=email)
           token = get_random_string(length=32)
           PasswordRecoveryRequest.objects.create(user=user, token=token)
           send_mail(
               'Password Recovery',
               f'Click the link to reset your password: http://example.com/reset-password/{token}',
               'noreply@example.com',
               [email],
           )
           return render(request, 'password_recovery.html', {'message': 'Instructions have been sent to your email'})
       except User.DoesNotExist:
           return render(request, 'password_recovery.html', {'error': 'Email address not found'})

   def reset_password_page(request, token):
       try:
           recovery_request = PasswordRecoveryRequest.objects.get(token=token)
           return render(request, 'reset_password.html', {'token': token})
       except PasswordRecoveryRequest.DoesNotExist:
           return redirect('login_page')

   def submit_new_password(request):
       token = request.POST['token']
       new_password = request.POST['new_password']
       confirm_password = request.POST['confirm_password']
       if new_password != confirm_password:
           return render(request, 'reset_password.html', {'error': 'Passwords do not match', 'token': token})
       try:
           recovery_request = PasswordRecoveryRequest.objects.get(token=token)
           user = recovery_request.user
           user.set_password(new_password)
           user.save()
           recovery_request.delete()
           return render(request, 'login.html', {'message': 'Password successfully reset. You can now log in with your new password'})
       except PasswordRecoveryRequest.DoesNotExist:
           return redirect('login_page')