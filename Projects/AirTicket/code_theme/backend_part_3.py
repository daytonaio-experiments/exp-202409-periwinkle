# urls.py
from django.urls import path
from . import views

urlpatterns = [
    path('api/get-background-color/', views.get_background_color, name='get_background_color'),
    path('api/set-background-color/', views.set_background_color, name='set_background_color'),
]