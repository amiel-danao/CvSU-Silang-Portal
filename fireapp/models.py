import django
from django.contrib.auth.models import Group
from django.db.models.signals import post_save, post_delete
from django.dispatch import receiver
from django.db import models
from django.contrib.auth.models import AbstractBaseUser, PermissionsMixin
from django.utils.translation import gettext_lazy as _
from django.utils import timezone
from datetime import date
from django.core.validators import MaxValueValidator, MinValueValidator
from django.core.validators import RegexValidator
from fireapp.managers import CustomUserManager
from django.core.exceptions import ValidationError

GENDER_CHOICES = (
    ("M", "Male"),
    ("F", "Female"),
)

CONST_TYPE_ADMIN = 1
CONST_TYPE_TEACHER = 2
CONST_TYPE_STUDENT = 3
ADMIN_TYPE = ((CONST_TYPE_ADMIN, "Admin"),)
TEACHER_TYPE = ((CONST_TYPE_TEACHER, "Teacher"),)
STUDENT_TYPE = ((CONST_TYPE_STUDENT, "Student"),)

validator_fn = [
    RegexValidator(r"[0-9]{6}-[0-9]{3}", "only valid id number is required"),
    RegexValidator(r"[0-9]{4}-[0-9]{2}-[0-9]{3}", "only valid id number is required"),
]


def regex_validators(value):
    err = None
    for validator in validator_fn:
        try:
            validator(value)
            # Valid value, return it
            return value
        except ValidationError as exc:
            err = exc
    # Value match nothing, raise error
    raise err


class CustomUser(AbstractBaseUser, PermissionsMixin):
    id = models.AutoField(primary_key=True)
    uid = models.CharField(
        verbose_name="id",
        max_length=11,
        validators=[
            regex_validators,
        ],
        unique=True,
    )
    email = models.EmailField(_("email address"), blank=False)
    is_staff = models.BooleanField(default=False)
    is_active = models.BooleanField(default=True)
    date_joined = models.DateTimeField(default=timezone.now)

    gender = models.CharField(default="M", max_length=1, choices=GENDER_CHOICES)
    birth_date = models.DateField(default=django.utils.timezone.now)
    first_name = models.CharField(default="", blank=False, max_length=50)
    middle_name = models.CharField(blank=True, max_length=50, null=True)
    last_name = models.CharField(default="", blank=False, max_length=50)
    raw_password = models.CharField(default="", blank=False, max_length=50)

    user_type = models.PositiveSmallIntegerField(
        default=CONST_TYPE_STUDENT, choices=TEACHER_TYPE + STUDENT_TYPE
    )

    USERNAME_FIELD = "uid"
    REQUIRED_FIELDS = []

    objects = CustomUserManager()

    def __str__(self):
        return self.email

    class Meta:
        app_label = "fireapp"
        verbose_name = "User"

    def set_password(self, raw_password):
        super().set_password(raw_password)
        self.raw_password = raw_password


class Section(models.Model):
    id = models.BigAutoField(db_column="id", primary_key=True)
    section_name = models.CharField(unique=True, max_length=100)

    def __str__(self):
        return self.section_name


class Department(models.Model):
    id = models.BigAutoField(db_column="dept_id", primary_key=True)
    name = models.CharField(unique=True, max_length=255)

    def __str__(self):
        return self.name


class Subject(models.Model):
    subject_name = models.CharField(max_length=50)
    unit = models.IntegerField()

    def __str__(self):
        return self.subject_name


class Course(models.Model):
    id = models.BigAutoField(db_column="course_id", primary_key=True)
    course_name = models.CharField(unique=True, max_length=100)
    course_abbr = models.CharField(
        db_column="course_abbr", max_length=20, blank=True, default=""
    )
    course_department = models.ForeignKey(
        Department,
        on_delete=models.SET_NULL,
        db_column="course_department_id",
        null=True,
    )
    course_credit = models.PositiveSmallIntegerField()

    subjects = models.ManyToManyField(Subject)

    def __str__(self):
        return self.course_name


class Student(models.Model):
    user = models.OneToOneField(
        CustomUser,
        on_delete=models.CASCADE,
        primary_key=True,
        related_name="student",
        to_field="id",
    )
    scholar_no = models.CharField(unique=True, max_length=15)
    date_enrolled = models.DateField(default=django.utils.timezone.now)
    section = models.ForeignKey(
        Section, on_delete=models.SET_NULL, blank=True, null=True
    )

    course = models.ForeignKey(Course, on_delete=models.SET_NULL, blank=True, null=True)

    current_year = models.PositiveSmallIntegerField(
        default=1, validators=[MaxValueValidator(6), MinValueValidator(1)]
    )

    current_semester = models.PositiveSmallIntegerField(
        default=1, validators=[MaxValueValidator(4), MinValueValidator(1)]
    )

    mobile = models.PositiveBigIntegerField(default=0, blank=True)
    parents_mobile = models.PositiveBigIntegerField(default=0, blank=True)
    home_address = models.TextField(blank=True)

    def __str__(self):
        return self.user.first_name + " " + self.user.last_name

    class Meta:
        permissions = [
            ("is_student", "Student account"),
        ]


class Teacher(models.Model):
    user = models.OneToOneField(
        CustomUser,
        on_delete=models.CASCADE,
        primary_key=True,
        related_name="teacher",
        to_field="id",
    )
    teacher_id = models.CharField(max_length=40, unique=True, null=True)
    sections = models.ManyToManyField(Section)
    department = models.ForeignKey(
        Department, on_delete=models.SET_NULL, blank=True, null=True
    )
    subjects = models.ManyToManyField(Subject)

    def __str__(self):
        return self.user.first_name + " " + self.user.last_name

    class Meta:
        permissions = [
            ("is_teacher", "Teacher account"),
        ]


class Grade(models.Model):
    id = models.BigAutoField(primary_key=True)
    grade = models.FloatField(
        default=0, blank=False, validators=[MinValueValidator(0.0)]
    )
    average = models.FloatField(
        default=0,
        blank=True,
        validators=[MinValueValidator(0.0), MaxValueValidator(100.0)],
    )

    student = models.ForeignKey(Student, on_delete=models.SET_NULL, null=True)
    subject = models.ForeignKey(
        Subject, on_delete=models.SET_NULL, null=True, blank=True
    )
    student_year = models.PositiveSmallIntegerField(
        default=1, validators=[MaxValueValidator(6), MinValueValidator(1)]
    )

    student_semester = models.PositiveSmallIntegerField(
        default=1, validators=[MaxValueValidator(4), MinValueValidator(1)]
    )

    class Meta:
        unique_together = ("student", "subject", "student_year", "student_semester")

    def __str__(self):
        return str(self.student)


class QuizData(models.Model):
    student = models.ForeignKey(Student, on_delete=models.SET_NULL, null=True)
    score = models.IntegerField()
    date_taken = models.DateTimeField(null=False)

    def __str__(self):
        return (
            "Quiz - ("
            + str(self.score)
            + ")"
            + self.student.user.first_name
            + " "
            + self.student.user.last_name
        )


class Quiz(models.Model):
    id = models.BigAutoField(primary_key=True)
    name = models.CharField(unique=True, max_length=255)
    quiz_datas = models.ManyToManyField(QuizData)
    total_score = models.IntegerField()

    class Meta:
        verbose_name_plural = "quizzes"

    def __str__(self):
        return self.name


@receiver(post_save, sender=CustomUser)
def create_user_profile(sender, instance, created, **kwargs):
    if created:
        if instance.user_type == CONST_TYPE_TEACHER:
            new_teacher_id = str(date.today().year) + "-E" + str(instance.id).zfill(5)
            Teacher.objects.create(user=instance, teacher_id=new_teacher_id)
            group = Group.objects.get(name="Teachers")
            if group:
                instance.groups.add(group)
                instance.save()
        if instance.user_type == CONST_TYPE_STUDENT:
            # today = timezone.now()
            # semester = get_semester_by_date(today)
            # new_scholar_no = f'{str(today.year)}-{semester}-{str(instance.id).zfill(3)}'
            existing_profile = Student.objects.filter(scholar_no=instance.uid).first()
            if existing_profile is None:
                Student.objects.create(user=instance, scholar_no=instance.uid)
            group = Group.objects.get(name="Students")
            if group:
                instance.groups.add(group)
                instance.save()

    else:
        if instance.user_type == CONST_TYPE_TEACHER:
            instance.teacher.save()
        if instance.user_type == CONST_TYPE_STUDENT:
            instance.student.save()


def get_semester_by_date(date_value):
    return '02' if date_value.month >= 6 else '01'


# @receiver(post_save, sender=CustomUser)
# def save_user_profile(sender, instance, **kwargs):
#     if instance.user_type == CONST_TYPE_TEACHER:
#         instance.teacher.save()
#     if instance.user_type == CONST_TYPE_STUDENT:
#         instance.student.save()


@receiver(post_delete, sender=CustomUser)
def delete_user(sender, instance, *args, **kwargs):
    if instance.user_type == CONST_TYPE_TEACHER:
        Teacher.objects.filter(user=instance).delete()
    if instance.user_type == CONST_TYPE_STUDENT:
        Student.objects.filter(user=instance).delete()


@receiver(post_delete, sender=Student)
def delete_student(sender, instance, *args, **kwargs):
    CustomUser.objects.filter(id=instance.user.id).delete()


@receiver(post_delete, sender=Teacher)
def delete_teacher(sender, instance, *args, **kwargs):
    CustomUser.objects.filter(id=instance.user.id).delete()
