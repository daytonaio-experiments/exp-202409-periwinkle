# models.py
from django.contrib.auth.models import User
from django.db import models

class UserProfile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    background_color = models.CharField(max_length=10, default='light')

    def __str__(self):
        return self.user.username