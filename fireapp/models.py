# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models

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

class Course(models.Model):
    id = models.BigAutoField(db_column='course_id', primary_key=True)
    course_name = models.CharField(unique=True, max_length=100)
    course_abbr = models.CharField(db_column='course_abbr', max_length=20)
    course_department = models.ForeignKey(
        Department,
        on_delete=models.CASCADE,
        db_column='course_department_id'
    )
    course_credit = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'courses'


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


class Student(models.Model):
    id = models.BigAutoField(primary_key=True)
    email = models.CharField(max_length=100)
    scholar_no = models.CharField(unique=True, max_length=15)
    name = models.CharField(max_length=100)
    gender = models.CharField(max_length=6)
    department = models.IntegerField()
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

    class Meta:
        managed = False
        db_table = 'teachers'
