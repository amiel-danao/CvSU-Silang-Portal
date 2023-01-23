from django.contrib.auth.forms import UserCreationForm, UserChangeForm
from fireapp.models import ADMIN_TYPE, STUDENT_TYPE, TEACHER_TYPE, CustomUser
import logging

logger = logging.getLogger("cvsu_logger")


# see https://stackoverflow.com/questions/20833638/how-to-log-all-django-form-validation-errors
class LoggingMixin(object):
    def add_error(self, field, error):
        if field:
            logger.info("Form error on field %s: %s", field, error)
        else:
            logger.info("Form error: %s", error)
        super().add_error(field, error)


class CustomUserCreateBaseForm(LoggingMixin, UserCreationForm):
    class Meta:
        model = CustomUser
        fields = (
            "uid",
            "email",
            "password1",
            "password2",
            "user_type",
            "is_active",
            "first_name",
            "last_name",
            "middle_name",
            "birth_date",
            "gender",
        )


class CustomAdminUserCreationForm(CustomUserCreateBaseForm):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        type_choices = ADMIN_TYPE + TEACHER_TYPE
        # type_choices.append(ADMIN_TYPE)
        self.fields["user_type"].choices = type_choices


class CustomUserChangeForm(LoggingMixin, UserChangeForm):
    class Meta:
        model = CustomUser
        fields = ("uid", "email", "user_type", "groups", "user_permissions")
