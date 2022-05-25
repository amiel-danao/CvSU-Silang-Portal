from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from django.apps import apps
from fireapp.models import Course, Subject, Student
from django.contrib.auth import get_user_model
from .forms import CustomUserCreationForm, CustomUserChangeForm
CustomUser = get_user_model()
from django.db.models import ManyToOneRel, ForeignKey, OneToOneField

@admin.register(Course)
class CourseAdmin(admin.ModelAdmin):
    model = Course
    list_display = ('id', 'course_abbr', 'course_name', 'get_department_name', 'course_credit')
    list_editable = ['course_credit']
    filter_horizontal = ('subjects',) 

    @admin.display(description='Department Name', ordering='department__name')
    def get_department_name(self, obj):
        return obj.course_department.name
            
    def save_related(self, request, form, formsets, change):
        obj = form.instance
        # make changes to model instance
        #form.instance.subjects.add(form.subjects)      
        print(request)
        print(form)
        obj.save()
        super().save_related(request, form, formsets, change)

"""
class CustomUserAdmin(admin.StackedInline):
    add_form = CustomUserCreationForm
    form = CustomUserChangeForm
    model = CustomUser
    list_display = ('email', 'is_active',)
    list_filter = ('email', 'is_active',)
    filter_horizontal = ('groups', 'user_permissions',)
    fieldsets = (
        (None, {'fields': ('email', 'password')}),
        ('Permissions', {'fields': ('is_active', 'groups', 'user_permissions')}),
    )
    add_fieldsets = (
        (None, {
            'classes': ('wide',),
            'fields': ('email', 'password1', 'password2', 'is_active')}
        ),
    )
    search_fields = ('email',)
    ordering = ('email',)

admin.site.register(CustomUser, CustomUserAdmin)



class StudentInline(admin.TabularInline):
    model = Student
    fk_name = 'user'
    can_delete = False
    max_num = 1 
    verbose_name_plural = ('student')

# Define a new User admin
class CustomStudentAdmin(UserAdmin):
    inlines = (StudentInline, )
    ordering = ('email',)
    list_display = ('email', 'is_active',)

# Re-register UserAdmin
admin.site.register(CustomUser, CustomStudentAdmin)
"""

class StudentInline(admin.TabularInline):
    model = Student

@admin.register(CustomUser)
class CustomStudentAdmin(admin.ModelAdmin):
    inlines = [StudentInline]
    ordering = ('email',)
    list_display = ('email', 'is_active',)

"""
StudentAdmin = lambda model: type('SubClass'+model.__name__, (admin.ModelAdmin,), {
    'list_display': [x.name for x in model._meta.fields],
    'list_select_related': [x.name for x in model._meta.fields if isinstance(x, (ManyToOneRel, ForeignKey, OneToOneField,))]
})

admin.site.register(Student, StudentAdmin(Student))


class CustomStudentAdmin(UserAdmin):
    model = Student
    inlines = (CustomUserAdmin, )
    list_display = ('first_name', 'last_name')

    def get_fieldsets(self, request, obj=None):
        fieldsets = list(super().get_fieldsets(request, obj))
        # update the `fieldsets` with your specific fields
        fieldsets.append(
            ('Personal info', {'fields': ('first_name', 'last_name', 'home_address')}))
        return fieldsets

admin.site.register(Student, CustomStudentAdmin)
"""

#class CustomStudentAdmin(admin.ModelAdmin):
#    model = Student
#    exclude = ('user',)

#admin.site.unregister(User)
#admin.site.register(Student, CustomStudentAdmin)
"""
class ProfileInline(admin.StackedInline):
    model = Profile
    can_delete = False
    verbose_name_plural = 'Profile'
    fk_name = 'user'

    
    def get_fields(self, request, obj=None):
        fields = super(CustomUserAdmin, self).get_fields(request, obj)
        if not request.user.is_superuser:
            fields -= ('is_superuser',)

        return fields
    



class CustomUserAdmin(UserAdmin):
    inlines = (ProfileInline, )
    list_display = ('username', 'email', 'first_name', 'last_name', 'get_location')
    list_select_related = ('profile', )

    def get_location(self, instance):
        return instance.profile.location
    get_location.short_description = 'Location'

    def get_inline_instances(self, request, obj=None):
        if not obj:
            return list()
        return super(CustomUserAdmin, self).get_inline_instances(request, obj)

    #def get_exclude(self, request, obj=None):
    #    excluded = super().get_exclude(request, obj) or [] # get overall excluded fields

    #    if not request.user.is_superuser: # if user is not a superuser
    #        return ['is_superuser']#['password', 'groups', 'date_joined', 'user_permissions', 'is_superuser']

    #    return excluded # otherwise return the default excluded fields if any

    

    


"""


app_config = apps.get_app_config('fireapp') # Replace your_app_name it is just a placeholder
models = app_config.get_models()

for model in models:
    try:
        admin.site.register(model)
    except admin.sites.AlreadyRegistered:
        pass