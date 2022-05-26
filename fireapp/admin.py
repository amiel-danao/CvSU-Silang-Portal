from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from django.apps import apps
from fireapp.models import ADMIN_TYPE, CONST_TYPE_ADMIN, CONST_TYPE_STUDENT, CONST_TYPE_TEACHER, USER_TYPE, Course, Subject, Student, Teacher
from django.contrib.auth import get_user_model
from .forms import CustomAdminUserCreationForm, CustomUserChangeForm, CustomUserCreateBaseForm
CustomUser = get_user_model()



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

class StudentInline(admin.StackedInline):
    model = Student
    can_delete = False

#class TeacherInline(admin.StackedInline):
#    model = Teacher
#    can_delete = False

@admin.register(Teacher)
class CustomTeacherAdmin(admin.ModelAdmin):
    model = Teacher
    list_display = ('get_teacher_name',)
    readonly_fields = ('user', )
    filter_horizontal = ('sections',)

    fieldsets = (       
        (None, {'fields' : ('user', 'sections')}),
    )

    def get_teacher_name(self, obj):
        return obj.user.first_name + " " + obj.user.last_name
    get_teacher_name.admin_order_field  = 'Teacher'  #Allows column order sorting
    get_teacher_name.short_description = 'Teacher Name'  #Renames column head

    def get_queryset(self, request):
        qs = super().get_queryset(request)
        if request.user.user_type == CONST_TYPE_TEACHER:
            return qs.filter(user=request.user)
        else:
            return qs

@admin.register(Student)
class CustomStudentAdmin(admin.ModelAdmin):
    model = Student
    list_display = ('get_student_name', 'scholar_no', 'section')
    list_filter = ('section', )
    search_fields = ('scholar_no', )
    readonly_fields = ('student_email', 'student_section')

    fieldsets = (       
        (None, {'fields' : ('scholar_no', 'student_email', 'student_section', 'mobile', 'parents_mobile', 'home_address')}),
    )

    def student_email(self, obj):
        return obj.user.email

    def student_section(self, obj):
        return obj.section

    def get_student_name(self, obj):
        return obj.user.first_name + " " + obj.user.last_name
    get_student_name.admin_order_field  = 'Student'  #Allows column order sorting
    get_student_name.short_description = 'Student Name'  #Renames column head

    def get_queryset(self, request):
        qs = super().get_queryset(request)
        if request.user.user_type == CONST_TYPE_STUDENT:
            return qs.filter(user=request.user)
        else:
            return qs

@admin.register(CustomUser)
class CustomUserAdmin(UserAdmin):
    add_form = CustomUserCreateBaseForm
    form = CustomUserChangeForm
    ordering = ('email',)
    list_display = ('email', 'first_name', 'last_name', '_user_type', 'is_active',)
    list_filter = ('user_type', 'is_active',)
    search_fields = ('email', 'first_name', 'last_name')
    filter_horizontal = ('groups', 'user_permissions',)
    #inlines = []
    exclude = ('is_superuser', 'last_login', 'date_joined')
    readonly_fields = ('_user_type', )

    def get_queryset(self, request):
        qs = super().get_queryset(request)
        if request.user.user_type == CONST_TYPE_TEACHER:
            return qs.exclude(user_type=CONST_TYPE_ADMIN)
        elif request.user.user_type == CONST_TYPE_STUDENT:
            return qs.filter(id=request.user.id)
        else:
            return qs

    fieldsets = (       
        ('User Information', {'fields' : ('email', 'password', '_user_type')}),
        ('Personal Information', {'fields': ('first_name', 'last_name', 'middle_name', 'birth_date', 'gender')}),
        ('Permissions', {'fields': ('is_active', 'groups', 'user_permissions')}),
    )

    add_fieldsets = (
        ('User Information', {
            'classes': ('wide',),
            'fields': ('email', 'password1', 'password2', 'user_type', 'is_active')}
        ),
        ('Personal Information', {
            'classes': ('wide',),
            'fields': ('first_name', 'last_name', 'middle_name', 'birth_date', 'gender')})
    )

    def _user_type(self, obj):
        return dict(ADMIN_TYPE + USER_TYPE)[int(obj.user_type)]

    #def get_form(self, request, obj=None, **kwargs):
        
        #if not obj:
        #    if request.user.user_type == str(CONST_TYPE_ADMIN):
        #        return CustomAdminUserCreationForm
    #    return super().get_form(request, obj, **kwargs)

    def get_readonly_fields(self, request, obj=None):
        if obj and not request.user.user_type == CONST_TYPE_ADMIN:
            # We are adding an object
            return self.readonly_fields + ('user_permissions', 'groups')
        else:
            return self.readonly_fields

    def formfield_for_choice_field(self, db_field, request, **kwargs):
        if db_field.name == 'user_type':
            if request.user.user_type == str(CONST_TYPE_ADMIN):
                kwargs['choices'] = ADMIN_TYPE + USER_TYPE

        return super().formfield_for_choice_field(db_field, request, **kwargs)

    #def get_exclude(self, request, obj=None):
    #    if obj and not request.user.user_type == CONST_TYPE_ADMIN:
    #        return ('user_permissions', 'groups') + super().get_exclude(request, obj)
                
    #    return super().get_exclude(request, obj)

    def save_model(self, request, obj, form, change):
        obj.is_superuser = obj.user_type == CONST_TYPE_ADMIN
        obj.is_staff = 1
        obj.save()

    def add_view(self, request, form_url='', extra_context=None):
    
        user = request.user
        if user:
            if user.user_type == CONST_TYPE_TEACHER:    
                self.inlines = [TeacherInline]
            if user.user_type == CONST_TYPE_STUDENT:    
                self.inlines = [StudentInline]

        return super(BaseMarketModelAdmin, self).add_view(
            request, form_url, extra_context)
    """
    def change_view(self, request, object_id, form_url='', extra_context=None):
        self.inlines = []
        
        user = CustomUser.objects.get(pk=object_id)
        if user:
            if user.user_type == CONST_TYPE_TEACHER:    
                self.inlines = [TeacherInline]
            if user.user_type == CONST_TYPE_STUDENT:    
                self.inlines = [StudentInline]

        return super().change_view(request, object_id, form_url, extra_context)
    """
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