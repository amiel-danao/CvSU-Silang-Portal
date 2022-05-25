import django
from django.db.models.signals import post_save
from django.dispatch import receiver
from django.db import models
from django.contrib.auth.models import AbstractUser
from django.utils.translation import gettext_lazy as _
from django.contrib.auth import get_user_model

User = get_user_model()

from fireapp.managers import CustomUserManager

GENDER_CHOICES = (
        ('M', 'Male'),
        ('F', 'Female'),
    )

class CustomUser(AbstractUser):
    username = None
    email = models.EmailField(_('email address'), unique=True)

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = []

    user_type_data=((1,"Admin"),(2,"Teacher"),(3,"Student"))
    user_type=models.CharField(default=1,choices=user_type_data,max_length=10)

    objects = CustomUserManager()

    def __str__(self):
        return self.email

class Teacher(models.Model):
    id=models.AutoField(primary_key=True)
    user=models.OneToOneField(CustomUser,on_delete=models.CASCADE, default=1)
    objects=models.Manager()

class Section(models.Model):
    id = models.BigAutoField(db_column='id', primary_key=True, default=1)
    section_name = models.CharField(unique=True, max_length=100)


class Student(models.Model):
    id = models.BigAutoField(primary_key=True)
    user=models.OneToOneField(CustomUser,on_delete=models.CASCADE, default=1)
    email = models.CharField(unique=True, blank=True, max_length=100)
    scholar_no = models.CharField(unique=True, max_length=15)
    first_name = models.CharField(default="", blank=False, max_length=50)
    middle_name = models.CharField(blank=True, max_length=50)
    last_name = models.CharField(default="", blank=False, max_length=50)
    gender = models.CharField(max_length=1, choices=GENDER_CHOICES)
    birth_date = models.DateField(default=django.utils.timezone.now)
    section = models.ForeignKey(
        Section,
        on_delete=models.CASCADE,
        default=1
    )

    mobile = models.PositiveBigIntegerField(default=0, blank=True)
    parents_mobile = models.PositiveBigIntegerField(default=0, blank=True)
    home_address = models.TextField(blank=True)
    objects=models.Manager()


class Courses(models.Model):
    id=models.AutoField(primary_key=True)
    course_name=models.CharField(max_length=255)

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
        if instance.user_type==1:
            User.objects.create(admin=instance)
        if instance.user_type==2:
            Teacher.objects.create(admin=instance)
        if instance.user_type==3:
            Student.objects.create(admin=instance)

@receiver(post_save,sender=CustomUser)
def save_user_profile(sender,instance,**kwargs):
    if instance.user_type==1:
        instance.user.save()
    if instance.user_type==2:
        instance.teacher.save()
    if instance.user_type==3:
        instance.students.save()


