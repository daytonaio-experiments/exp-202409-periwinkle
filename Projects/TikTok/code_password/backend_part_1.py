from django.contrib.auth.models import User
from django.db import models

# Assuming we are extending the default user model
# If not, you can ignore this and use the default User model directly
class Profile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    # Add any additional fields if necessary