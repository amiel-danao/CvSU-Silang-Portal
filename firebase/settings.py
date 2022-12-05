"""
Django settings for firebase project.

Generated by 'django-admin startproject' using Django 4.0.4.

For more information on this file, see
https://docs.djangoproject.com/en/4.0/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/4.0/ref/settings/
"""

from pathlib import Path
import os

# Build paths inside the project like this: BASE_DIR / 'subdir'.
BASE_DIR = Path(__file__).resolve().parent.parent


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/4.0/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = "django-insecure-5%(rt_(_f1(eec4u@2k)l#@dud=k2sx%_=i!^%n$&z^=c0zwlx"

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

ALLOWED_HOSTS = ["127.0.0.1", "csvu.pythonanywhere.com"]


# Application definition

INSTALLED_APPS = [
    "fireapp",
    "baton",
    "django.contrib.admin",
    "django.contrib.auth",
    "django.contrib.contenttypes",
    "django.contrib.sessions",
    "django.contrib.messages",
    "django.contrib.staticfiles",
    "baton.autodiscover",
    "import_export",
]

MIDDLEWARE = [
    "django.middleware.security.SecurityMiddleware",
    "django.contrib.sessions.middleware.SessionMiddleware",
    "django.middleware.common.CommonMiddleware",
    "django.middleware.csrf.CsrfViewMiddleware",
    "django.contrib.auth.middleware.AuthenticationMiddleware",
    "django.contrib.messages.middleware.MessageMiddleware",
    "django.middleware.clickjacking.XFrameOptionsMiddleware",
]

ROOT_URLCONF = "firebase.urls"

TEMPLATES = [
    {
        "BACKEND": "django.template.backends.django.DjangoTemplates",
        "DIRS": [os.path.join(BASE_DIR, "templates")],
        "APP_DIRS": True,
        "OPTIONS": {
            "context_processors": [
                "django.template.context_processors.debug",
                "django.template.context_processors.request",
                "django.contrib.auth.context_processors.auth",
                "django.contrib.messages.context_processors.messages",
            ],
        },
    },
]

WSGI_APPLICATION = "firebase.wsgi.application"


# Database
# https://docs.djangoproject.com/en/4.0/ref/settings/#databases


if os.environ.get("DJANGO_ENV") == "LOCAL":
    DATABASES = {
        "default": {
            "ENGINE": "django.db.backends.mysql",
            "NAME": "csvu$csvu_database",
            "USER": "root",
            "PASSWORD": "",
            "HOST": "127.0.0.1",
            "PORT": "3333",
        }
    }
else:
    DATABASES = {
        "default": {
            "ENGINE": "django.db.backends.mysql",
            "NAME": "csvu$csvu_database",
            "USER": "csvu",
            "PASSWORD": "notcommonpassword1234",
            "HOST": "csvu.mysql.pythonanywhere-services.com",
            "PORT": "3306",
        }
    }


# Password validation
# https://docs.djangoproject.com/en/4.0/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        "NAME": "django.contrib.auth.password_validation.UserAttributeSimilarityValidator",
    },
    {
        "NAME": "django.contrib.auth.password_validation.MinimumLengthValidator",
    },
    {
        "NAME": "django.contrib.auth.password_validation.CommonPasswordValidator",
    },
    {
        "NAME": "django.contrib.auth.password_validation.NumericPasswordValidator",
    },
]


# Internationalization
# https://docs.djangoproject.com/en/4.0/topics/i18n/

LANGUAGE_CODE = "en-us"

TIME_ZONE = "UTC"

USE_I18N = True

USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/4.0/howto/static-files/

STATIC_URL = "static/"

STATIC_ROOT = os.path.join(BASE_DIR, "static")

# Default primary key field type
# https://docs.djangoproject.com/en/4.0/ref/settings/#default-auto-field

DEFAULT_AUTO_FIELD = "django.db.models.BigAutoField"

BATON = {
    "SITE_HEADER": "CVSU-Portal",
    "SITE_TITLE": "CVSU-Portal",
    "INDEX_TITLE": "CVSU-Portal",
    "COPYRIGHT": "copyright © 2022 CVSU - Portal",
    "SUPPORT_HREF": "",
    "POWERED_BY": "",
    "CONFIRM_UNSAVED_CHANGES": True,
    "SHOW_MULTIPART_UPLOADING": True,
    "ENABLE_IMAGES_PREVIEW": True,
    "CHANGELIST_FILTERS_IN_MODAL": True,
    "CHANGELIST_FILTERS_ALWAYS_OPEN": False,
    "CHANGELIST_FILTERS_FORM": True,
    "MENU_ALWAYS_COLLAPSED": False,
    "MENU_TITLE": "Menu",
    "MESSAGES_TOASTS": False,
    "GRAVATAR_DEFAULT_IMG": "mp",
    "LOGIN_SPLASH": "/static/admin/images/login.jpg",
    "MENU": (
        {"type": "title", "label": "main", "apps": ("auth", "fireapp")},
        {
            "type": "free",
            "label": "Authentication",
            "icon": "fa fa-lock",
            "children": [
                {"name": "user", "label": "Users", "type": "model", "app": "auth"},
                {"name": "group", "label": "Groups", "type": "model", "app": "auth"},
                {
                    "name": "student",
                    "label": "Students",
                    "type": "model",
                    "app": "fireapp",
                },
            ],
        },
        {
            "type": "free",
            "label": "Curriculum",
            "icon": "fa fa-tasks",
            "children": [
                {
                    "name": "department",
                    "label": "Departments",
                    "type": "model",
                    "app": "fireapp",
                },
                {
                    "name": "course",
                    "label": "Courses",
                    "type": "model",
                    "app": "fireapp",
                },
                {"name": "grade", "label": "Grades", "type": "model", "app": "fireapp"},
            ],
        },
        # { 'type': 'title', 'label': 'Contents', 'apps': ('flatpages', ) },
        # { 'type': 'model', 'label': 'Pages', 'name': 'flatpage', 'app': 'flatpages' },
        {
            "type": "free",
            "label": "My Profile",
            "url": "/fireapp/customuser/",
            "perms": ("fireapp.is_student",),
        },
        # { 'type': 'free', 'label': 'Teacher Profile', 'url': '/fireapp/customuser/', 'perms': ('fireapp.is_teacher',) },
        # { 'type': 'free', 'label': 'Manage', 'default_open': True, 'children': [
        #    { 'type': 'model', 'label': 'Courses', 'name': 'courses', 'app': 'fireapp' },
        # ] }
    ),
}

AUTH_USER_MODEL = "fireapp.CustomUser"

LOGGING = {
    "version": 1,
    "disable_existing_loggers": False,
    "formatters": {
        "timestamp": {
            "format": "{asctime} {levelname} {message}",
            "style": "{",
        },
    },
    "handlers": {
        "file": {
            "level": "INFO",
            "class": "logging.FileHandler",
            "filename": "debug.log",
            "formatter": "timestamp",
        },
    },
    "loggers": {
        "cvsu_logger": {
            "handlers": ["file"],
            "level": "INFO",
            "propagate": True,
        },
    },
}

IMPORT_EXPORT_USE_TRANSACTIONS = True
LOGIN_REDIRECT_URL = "/fireapp/grade/"
LOGIN_URL = "/admin/login/"
