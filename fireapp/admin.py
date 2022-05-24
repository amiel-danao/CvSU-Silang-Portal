from django.contrib import admin

# Register your models here.
from django.apps import apps
from fireapp.models import Course, Subject

@admin.register(Course)
class CourseAdmin(admin.ModelAdmin):
    model = Course
    list_display = ('id', 'course_abbr', 'course_name', 'get_department_name', 'course_credit')
    list_editable = ['course_credit']
    filter_horizontal = ('subjects',) 

    @admin.display(description='Department Name', ordering='department__name')
    def get_department_name(self, obj):
        return obj.course_department.name
    
    def formfield_for_manytomany(self, db_field, request=None, **kwargs):
        if db_field.name == "subject_id":
            qs = kwargs.get("queryset", db_field.remote_field.model.objects)
            # Avoid a major performance hit resolving permission names which
            # triggers a content_type load:
            kwargs["queryset"] = qs.select_related("content_type")
        return super().formfield_for_manytomany(db_field, request=request, **kwargs)    


app_config = apps.get_app_config('fireapp') # Replace your_app_name it is just a placeholder
models = app_config.get_models()

for model in models:
    try:
        admin.site.register(model)
    except admin.sites.AlreadyRegistered:
        pass