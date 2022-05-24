from django.db import models

STUDENT = 1
TEACHER = 2
ADMIN = 3

class AttendanceData(models.Model):
    id = models.BigAutoField(primary_key=True)
    scholar_no = models.CharField(max_length=15)
    course_code = models.CharField(max_length=11)
    classes_attended = models.IntegerField()
    classes_total = models.IntegerField()
    percentage = models.FloatField()
    timestamp = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'attendance_data'


class Department(models.Model):
    id = models.BigAutoField(db_column='dept_id', primary_key=True)
    name = models.CharField(unique=True, max_length=255)

    class Meta:
        managed = False
        db_table = 'department'
    def __str__(self):
        return self.name

class Subject(models.Model):
    subject_name = models.CharField(max_length=50)
    unit = models.IntegerField()    

    class Meta:
        managed = False
        db_table = 'subject'
    def __str__(self):
        return self.subject_name

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

    class Meta:
        managed = False
        db_table = 'courses'
    def __str__(self):
        return self.course_name


class GradingScale(models.Model):
    id = models.BigAutoField(primary_key=True)
    teacher_id = models.IntegerField()
    course_code = models.CharField(max_length=10)
    course_dep = models.IntegerField()
    gradescale = models.CharField(max_length=100)
    timestamp = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'grading_scale'

class Section(models.Model):
    id = models.BigAutoField(db_column='id', primary_key=True)
    section_name = models.CharField(unique=True, max_length=100)

    class Meta:
        managed = False
        db_table = 'section'

class Student(models.Model):
    id = models.BigAutoField(primary_key=True)
    email = models.CharField(max_length=100)
    scholar_no = models.CharField(unique=True, max_length=15)
    name = models.CharField(max_length=100)
    gender = models.CharField(max_length=6)
    department = models.IntegerField()
    section = models.ForeignKey(
        Section,
        on_delete=models.CASCADE
    )
    semester = models.IntegerField()
    mobile = models.BigIntegerField()
    parents_mobile = models.BigIntegerField()
    courses = models.CharField(max_length=100)
    home_address = models.TextField()
    timestamp = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'students_info'


class Teacher(models.Model):
    id = models.BigAutoField(db_column='teacher_id', primary_key=True)
    name = models.CharField(max_length=255)
    email = models.CharField(unique=True, max_length=255, blank=True, null=True)
    privilege = models.CharField(max_length=15)
    dept_id = models.IntegerField(blank=True, null=True)
    mobile = models.BigIntegerField(unique=True)
    blocked = models.IntegerField()
    approved = models.IntegerField()
    sections = models.ManyToManyField(Section)

    class Meta:
        managed = False
        db_table = 'teachers'

@python_2_unicode_compatible
class Profile(models.Model):    
    ROLE_CHOICES = (
        (STUDENT, 'Student'),
        (TEACHER, 'Teacher'),
        (ADMIN, 'Admin'),
    )
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    location = models.CharField(max_length=30, blank=True)
    birthdate = models.DateField(null=True, blank=True)
    role = models.PositiveSmallIntegerField(choices=ROLE_CHOICES, null=True, blank=True)

    class Meta:
        verbose_name = 'profile'
        verbose_name_plural = 'profiles'

    def __str__(self):
        return self.user.username


@receiver(post_save, sender=User)
def create_or_update_user_profile(sender, instance, created, **kwargs):
    if created:
        Profile.objects.create(user=instance)
    instance.profile.save()