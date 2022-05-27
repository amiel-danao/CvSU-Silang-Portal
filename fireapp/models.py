import django
from django.contrib.auth.models import Group
from django.db.models.signals import post_save, post_delete
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

CONST_TYPE_ADMIN = 1
CONST_TYPE_TEACHER = 2
CONST_TYPE_STUDENT = 3
ADMIN_TYPE = ((CONST_TYPE_ADMIN,"Admin"),)
USER_TYPE =(
    (CONST_TYPE_TEACHER,"Teacher"),
    (CONST_TYPE_STUDENT,"Student"))

class CustomUser(AbstractBaseUser, PermissionsMixin):
    id = models.AutoField(primary_key=True)
    email = models.EmailField(_('email address'), unique=True)
    is_staff = models.BooleanField(default=False)
    is_active = models.BooleanField(default=True)
    date_joined = models.DateTimeField(default=timezone.now)

    gender = models.CharField(default="M", max_length=1, choices=GENDER_CHOICES)
    birth_date = models.DateField(default=django.utils.timezone.now)
    first_name = models.CharField(default="", blank=False, max_length=50)
    middle_name = models.CharField(blank=True, max_length=50)
    last_name = models.CharField(default="", blank=False, max_length=50)
    
    user_type=models.PositiveSmallIntegerField(default=1, choices=USER_TYPE)

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = []

    objects = CustomUserManager()

    def __str__(self):
        return self.email        

    class Meta:
        app_label = "fireapp"
        verbose_name = "User"

class Section(models.Model):
    id = models.BigAutoField(db_column='id', primary_key=True)
    section_name = models.CharField(unique=True, max_length=100)

    def __str__(self):
        return self.section_name

class Department(models.Model):
    id = models.BigAutoField(db_column='dept_id', primary_key=True)
    name = models.CharField(unique=True, max_length=255)

    def __str__(self):
        return self.name

class Student(models.Model):
    user = models.OneToOneField(CustomUser,on_delete=models.CASCADE, primary_key=True, related_name='student', to_field='id')
    scholar_no = models.CharField(unique=True, max_length=15)
    date_enrolled = models.DateField(default=django.utils.timezone.now)
    section = models.ForeignKey(
        Section,
        on_delete=models.SET_NULL,
        blank=True,
        null=True
    )

    mobile = models.PositiveBigIntegerField(default=0, blank=True)
    parents_mobile = models.PositiveBigIntegerField(default=0, blank=True)
    home_address = models.TextField(blank=True)


    def __str__(self):
        return self.user.first_name + " " + self.user.last_name

class Subject(models.Model):
    subject_name = models.CharField(max_length=50)
    unit = models.IntegerField()

    def __str__(self):
        return self.subject_name

class Teacher(models.Model):
    user = models.OneToOneField(CustomUser,on_delete=models.CASCADE, primary_key=True, related_name='teacher', to_field='id')
    teacher_id = models.CharField(max_length=40, unique=True, null=True)
    sections = models.ManyToManyField(Section)
    department = models.ForeignKey(
        Department,
        on_delete=models.SET_NULL,
        blank=True,
        null=True
    )
    subjects = models.ManyToManyField(Subject)

    def __str__(self):
        return self.user.first_name + " " + self.user.last_name
    

class AttendanceData(models.Model):
    id = models.BigAutoField(primary_key=True)
    date = models.DateField(default=django.utils.timezone.now)

    section = models.ForeignKey(
        Section,
        on_delete=models.SET_NULL,
        null=True
    )

    students_attended = models.ManyToManyField(Student)

    class Meta:
        unique_together = ('date', 'section',)

class QuizData(models.Model):    
    student = models.ForeignKey(Student, on_delete=models.SET_NULL, null=True)
    score = models.IntegerField()
    date_taken = models.DateTimeField(null=False)

class Quiz(models.Model):
    id = models.BigAutoField(primary_key=True)
    name = models.CharField(unique=True, max_length=255)
    quiz_datas = models.ManyToManyField(QuizData)
    total_score = models.IntegerField()

    class Meta:
        verbose_name_plural = "quizzes"

class Course(models.Model):
    id = models.BigAutoField(db_column='course_id', primary_key=True)
    course_name = models.CharField(unique=True, max_length=100)
    course_abbr = models.CharField(db_column='course_abbr', max_length=20, blank=True, default='')
    course_department = models.ForeignKey(
        Department,
        on_delete=models.SET_NULL,
        db_column='course_department_id',
        null=True
    )
    course_credit = models.PositiveSmallIntegerField()

    subjects = models.ManyToManyField(Subject)

    def __str__(self):
        return self.course_name


@receiver(post_save,sender=CustomUser)
def create_user_profile(sender,instance,created,**kwargs):
    if created:
        if instance.user_type == CONST_TYPE_TEACHER:
            Teacher.objects.create(user=instance)
            group = Group.objects.get(name='Teachers')
            if group:
                instance.groups.add(group)
                instance.save()
        if instance.user_type == CONST_TYPE_STUDENT:
            Student.objects.create(user=instance)
            group = Group.objects.get(name='Students')
            if group:
                instance.groups.add(group)
                instance.save()

@receiver(post_save,sender=CustomUser)
def save_user_profile(sender,instance,**kwargs):
    if instance.user_type == CONST_TYPE_TEACHER:
        instance.teacher.save()
    if instance.user_type == CONST_TYPE_STUDENT:
        instance.student.save()


@receiver(post_delete,sender=CustomUser)
def delete_user(sender,instance,*args,**kwargs):
    if instance.user_type == CONST_TYPE_TEACHER:
        Teacher.objects.filter(user=instance).delete()
    if instance.user_type == CONST_TYPE_STUDENT:
        Student.objects.filter(user=instance).delete()

@receiver(post_delete,sender=Student)
def delete_student(sender,instance,*args,**kwargs):
    CustomUser.objects.filter(id=instance.user.id).delete()

@receiver(post_delete,sender=Teacher)
def delete_teacher(sender,instance,*args,**kwargs):
    CustomUser.objects.filter(id=instance.user.id).delete()