from django.db import models
from django.contrib.auth.models import User
from django.utils import timezone

   class PasswordRecoveryRequest(models.Model):
       user = models.ForeignKey(User, on_delete=models.CASCADE)
       token = models.CharField(max_length=100, unique=True)
       created_at = models.DateTimeField(default=timezone.now)

       def __str__(self):
           return f"{self.user.email} - {self.token}"