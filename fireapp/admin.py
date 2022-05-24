from django.contrib import admin

# Register your models here.
from django.apps import apps
from fireapp.models import Course, Subject

class CourseAdmin(admin.ModelAdmin):
    model = Course
    list_display = ('id', 'course_abbr', 'course_name', 'get_department_name', 'course_credit')
    list_editable = ['course_credit']

    @admin.display(description='Department Name', ordering='department__name')
    def get_department_name(self, obj):
        return obj.course_department.name

admin.site.register(Course, CourseAdmin)



app_config = apps.get_app_config('fireapp') # Replace your_app_name it is just a placeholder
models = app_config.get_models()

for model in models:
    try:
        admin.site.register(model)
    except admin.sites.AlreadyRegistered:
        pass