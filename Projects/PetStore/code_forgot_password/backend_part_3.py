from django.urls import path
   from . import views

   urlpatterns = [
       path('', views.login_page, name='login_page'),
       path('password-recovery/', views.password_recovery_page, name='password_recovery_page'),
       path('submit-recovery-form/', views.submit_recovery_form, name='submit_recovery_form'),
       path('reset-password/<str:token>/', views.reset_password_page, name='reset_password_page'),
       path('submit-new-password/', views.submit_new_password, name='submit_new_password'),
   ]