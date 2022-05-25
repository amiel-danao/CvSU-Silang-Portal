import django
from django.db.models.signals import post_save
from django.dispatch import receiver
from django.db import models
from django.contrib.auth.models import AbstractBaseUser, PermissionsMixin
from django.utils.translation import gettext_lazy as _
from django.utils import timezone

from fireapp.managers import CustomUserManager

GENDER_CHOICES = (
        ('M', 'Male'),
        ('F', 'Female'),
    )

class CustomUser(AbstractBaseUser, PermissionsMixin):
    email = models.EmailField(_('email address'), unique=True)
    is_staff = models.BooleanField(default=False)
    is_active = models.BooleanField(default=True)
    date_joined = models.DateTimeField(default=timezone.now)

    gender = models.CharField(default="M", max_length=1, choices=GENDER_CHOICES)
    birth_date = models.DateField(default=django.utils.timezone.now)
    first_name = models.CharField(default="", blank=False, max_length=50)
    middle_name = models.CharField(blank=True, max_length=50)
    last_name = models.CharField(default="", blank=False, max_length=50)
    user_type_data=((1,"Admin"),(2,"Teacher"),(3,"Student"))
    user_type=models.CharField(default=1,choices=user_type_data,max_length=1)

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = []

    objects = CustomUserManager()

    def __str__(self):
        return self.email        

    class Meta:
        app_label = "fireapp"

class Teacher(models.Model):
    user=models.OneToOneField(CustomUser,on_delete=models.CASCADE, primary_key=True, related_name='teacher')

class Section(models.Model):
    id = models.BigAutoField(db_column='id', primary_key=True, default=1)
    section_name = models.CharField(unique=True, max_length=100)


class Student(models.Model):
    user = models.OneToOneField(CustomUser,on_delete=models.CASCADE, primary_key=True, related_name='student')
    scholar_no = models.CharField(unique=True, max_length=15)    
    section = models.ForeignKey(
        Section,
        on_delete=models.CASCADE,
        default=1
    )

    mobile = models.PositiveBigIntegerField(default=0, blank=True)
    parents_mobile = models.PositiveBigIntegerField(default=0, blank=True)
    home_address = models.TextField(blank=True)


class Subject(models.Model):
    subject_name = models.CharField(max_length=50)
    unit = models.IntegerField()

    def __str__(self):
        return self.subject_name

class AttendanceData(models.Model):
    id = models.BigAutoField(primary_key=True)
    section = models.ForeignKey(
        Section,
        on_delete=models.CASCADE,
        default=1
    )
    classes_attended = models.IntegerField()
    classes_total = models.IntegerField()
    date = models.DateField(default=django.utils.timezone.now)
    subject = models.ForeignKey(
        Subject,
        on_delete=models.CASCADE,
        default=1
    )



class Department(models.Model):
    id = models.BigAutoField(db_column='dept_id', primary_key=True)
    name = models.CharField(unique=True, max_length=255)

    def __str__(self):
        return self.name



class Course(models.Model):
    id = models.BigAutoField(db_column='course_id', primary_key=True)
    course_name = models.CharField(unique=True, max_length=100)
    course_abbr = models.CharField(db_column='course_abbr', max_length=20, blank=True, default='')
    course_department = models.ForeignKey(
        Department,
        on_delete=models.CASCADE,
        db_column='course_department_id'
    )
    course_credit = models.PositiveSmallIntegerField()

    subjects = models.ManyToManyField(Subject)

    def __str__(self):
        return self.course_name



@receiver(post_save,sender=CustomUser)
def create_user_profile(sender,instance,created,**kwargs):
    if created:
        #if instance.user_type==1:
        #    CustomUser.objects.create(user=instance)
        if instance.user_type==2:
            Teacher.objects.create(user=instance)
        if instance.user_type==3:
            Student.objects.create(user=instance)

@receiver(post_save,sender=CustomUser)
def save_user_profile(sender,instance,**kwargs):
    #if instance.user_type==1:
    #    instance.custom_users.save()
    if instance.user_type==2:
        instance.teachers.save()
    if instance.user_type==3:
        instance.students.save()


