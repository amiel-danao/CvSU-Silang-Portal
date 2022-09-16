from django.contrib.auth.base_user import BaseUserManager
from django.utils.translation import gettext_lazy as _


class CustomUserManager(BaseUserManager):
    """
    Custom user model manager where email is the unique identifiers
    for authentication instead of usernames.
    """

    def create_user(self, uid, password, **extra_fields):
        """
        Create and save a User with the given email and password.
        """
        if not uid:
            raise ValueError(_("The uid must be set"))
        user = self.model(uid=uid, **extra_fields)
        user.set_password(password)
        user.save()
        return user

    def create_superuser(self, uid, password, **extra_fields):
        """
        Create and save a SuperUser with the given uid and password.
        """
        extra_fields.setdefault("is_staff", True)
        extra_fields.setdefault("is_superuser", True)
        extra_fields.setdefault("is_active", True)

        if extra_fields.get("is_staff") is not True:
            raise ValueError(_("Superuser must have is_staff=True."))
        if extra_fields.get("is_superuser") is not True:
            raise ValueError(_("Superuser must have is_superuser=True."))
        return self.create_user(uid, password, **extra_fields)

    def create_student(self, uid, password, **extra_fields):
        """
        Create and save a SuperUser with the given uid and password.
        """
        extra_fields.setdefault("is_staff", True)
        extra_fields.setdefault("is_superuser", False)
        extra_fields.setdefault("is_active", True)
        extra_fields.setdefault("user_type", 3)

        if extra_fields.get("is_staff") is not True:
            raise ValueError(_("Superuser must have is_staff=True."))
        return self.create_user(uid, password, **extra_fields)
