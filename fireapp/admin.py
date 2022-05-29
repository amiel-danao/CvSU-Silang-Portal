from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from django.apps import apps
from django.http import HttpResponseRedirect
from django.urls import reverse
from fireapp.models import ADMIN_TYPE, CONST_TYPE_ADMIN, CONST_TYPE_STUDENT, CONST_TYPE_TEACHER, STUDENT_TYPE, TEACHER_TYPE, AttendanceData, Course, Department, Grade, Section, Subject, Student, Teacher, Quiz, QuizData
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

class StudentInline(admin.StackedInline):
    model = Student
    can_delete = False

#class TeacherInline(admin.StackedInline):
#    model = Teacher
#    can_delete = False

@admin.register(Teacher)
class CustomTeacherAdmin(admin.ModelAdmin):
    model = Teacher
    list_display = ('get_teacher_name', 'teacher_id', 'department', )
    readonly_fields = ('user', 'get_teacher_name')
    filter_horizontal = ('sections', 'subjects')

    sortable_by = (
        'teacher_id'
        'department',
    )

    fieldsets = (       
        (None, {'fields' : ('user', 'get_teacher_name', 'teacher_id', 'department', 'sections', 'subjects')}),
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

    def changelist_view(self, request, extra_context=None):
        if request.user.user_type == CONST_TYPE_TEACHER:
            user = request.user
            return HttpResponseRedirect(reverse("admin:%s_%s_change" %(self.model._meta.app_label, self.model._meta.model_name), args=(user.id,)))
        return super().changelist_view(request=request, extra_context=extra_context)

@admin.register(Student)
class CustomStudentAdmin(admin.ModelAdmin):
    model = Student
    list_display = ('get_student_name', 'scholar_no', 'section', 'current_year', 'current_semester')
    list_filter = ('section', )
    search_fields = ('scholar_no', )
    readonly_fields = ('student_email', 'get_student_name')

    sortable_by = (
        "scholar_no",
        "section",
        "current_year",
        "current_semester",
    )

    #fields = ('scholar_no', 'student_email', 'get_student_name', 'section', 'current_year', 'current_semester', 'mobile', 'parents_mobile', 'home_address')

    fieldsets = (       
        (None, {'fields' : ('scholar_no', 'student_email', 'get_student_name', 'section', 'current_year', 'current_semester', 'mobile', 'parents_mobile', 'home_address')}),
    )

    def student_email(self, obj):
        return obj.user.email

    def get_student_name(self, obj):
        return obj.user.first_name + " " + obj.user.last_name
    get_student_name.admin_order_field  = 'Student'  #Allows column order sorting
    get_student_name.short_description = 'Student Name'  #Renames column head

    def changelist_view(self, request, extra_context=None):
        if request.user.user_type == CONST_TYPE_STUDENT:
            user = request.user
            return HttpResponseRedirect(reverse("admin:%s_%s_change" %(self.model._meta.app_label, self.model._meta.model_name), args=(user.id,)))
        return super().changelist_view(request=request, extra_context=extra_context)

    def get_queryset(self, request):
        qs = super().get_queryset(request)
        if request.user.user_type == CONST_TYPE_STUDENT:
            return qs.filter(user=request.user)
        else:
            return qs

    def get_readonly_fields(self, request, obj=None):
        if obj and request.user.user_type == CONST_TYPE_STUDENT:
            # We are adding an object
            return self.readonly_fields + ('section', 'scholar_no')
        else:
            return self.readonly_fields

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
        return dict(ADMIN_TYPE + TEACHER_TYPE + STUDENT_TYPE)[int(obj.user_type)]

    def changelist_view(self, request, extra_context=None):
        if request.user.user_type == CONST_TYPE_STUDENT:
            user = request.user
            return HttpResponseRedirect(reverse("admin:%s_%s_change" %(self.model._meta.app_label, self.model._meta.model_name), args=(user.id,)))
        return super().changelist_view(request=request, extra_context=extra_context)

    #def get_form(self, request, obj=None, **kwargs):
        
        #if not obj:
        #    if request.user.user_type == str(CONST_TYPE_ADMIN):
        #        return CustomAdminUserCreationForm
    #    return super().get_form(request, obj, **kwargs)

    def get_readonly_fields(self, request, obj=None):
        if obj and not request.user.user_type == CONST_TYPE_ADMIN:
            # We are adding an object
            return self.readonly_fields + ('user_permissions', 'groups', 'is_active')
        else:
            return self.readonly_fields 

    def formfield_for_choice_field(self, db_field, request, **kwargs):
        if db_field.name == 'user_type':
            if request.user.user_type == CONST_TYPE_ADMIN:
                kwargs['choices'] = ADMIN_TYPE + TEACHER_TYPE
            if request.user.user_type == CONST_TYPE_TEACHER:
                kwargs['choices'] = STUDENT_TYPE

        return super().formfield_for_choice_field(db_field, request, **kwargs)

    #def get_exclude(self, request, obj=None):
    #    if obj and not request.user.user_type == CONST_TYPE_ADMIN:
    #        return ('user_permissions', 'groups') + super().get_exclude(request, obj)
                
    #    return super().get_exclude(request, obj)

    def save_model(self, request, obj, form, change):
        obj.is_superuser = obj.user_type == CONST_TYPE_ADMIN
        obj.is_staff = 1
        obj.save()
    """
    def add_view(self, request, form_url='', extra_context=None):
    
        user = request.user
        if user:
            if user.user_type == CONST_TYPE_TEACHER:    
                self.inlines = [TeacherInline]
            if user.user_type == CONST_TYPE_STUDENT:    
                self.inlines = [StudentInline]

        return super(BaseMarketModelAdmin, self).add_view(
            request, form_url, extra_context)
    
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

@admin.register(QuizData)
class QuizDataAdmin(admin.ModelAdmin):
    def get_form(self, request, obj=None, **kwargs):
        form = super().get_form(request, obj, **kwargs)
        form.base_fields['student'].widget.can_add_related = False
        form.base_fields['student'].widget.can_delete_related = False
        form.base_fields['student'].widget.can_change_related = False
        return form

@admin.register(Quiz)
class QuizAdmin(admin.ModelAdmin):
    filter_horizontal = ('quiz_datas',)

@admin.register(Subject)
class SubjectAdmin(admin.ModelAdmin):
    list_display = ('subject_name', 'unit')
    list_filter = ('subject_name', 'unit')

@admin.register(Department)
class DepartmentAdmin(admin.ModelAdmin):
    readonly_fields = ['teachers', ]

    def teachers(self, obj):
        #this_section = Section.objects.get(id=object_id)
        this_teachers = Teacher.objects.filter(department=obj)
        result = list()
        for teacher in this_teachers:
            result.append('{} - {} {}'.format(teacher.teacher_id, teacher.user.last_name, teacher.user.first_name))
        return '\n'.join(result)
    teachers.admin_order_field  = 'Teachers'  #Allows column order sorting
    teachers.short_description = 'Teachers'  #Renames column head   

@admin.register(Section)
class SectionAdmin(admin.ModelAdmin):

    readonly_fields = ['students', ]

    def students(self, obj):
        #this_section = Section.objects.get(id=object_id)
        this_students = Student.objects.filter(section=obj)
        result = list()
        for student in this_students:
            result.append('{} - {} {}'.format(student.scholar_no, student.user.last_name, student.user.first_name))
        return '\n'.join(result)
    students.admin_order_field  = 'Students'  #Allows column order sorting
    students.short_description = 'Students'  #Renames column head   

    #def change_view(self, request, object_id, form_url='', extra_context=None):
    #    extra_context = extra_context or {}
    #    this_section = Section.objects.get(id=object_id)
    #    extra_context['Students'] = Student.objects.filter(section=this_section)

    #    return super().change_view(request, object_id, form_url, extra_context=extra_context)

@admin.register(Grade)
class GradeAdmin(admin.ModelAdmin):
    list_display = ('grade', 'student', 'subject', 'student_year', 'student_semester',)
    list_filter = ('student', 'subject', 'student_year', 'student_semester',)
    
    def get_queryset(self, request):
        qs = super().get_queryset(request)
        if request.user.user_type == CONST_TYPE_STUDENT:
            this_student = Student.objects.get(user=request.user)
            return qs.filter(student=this_student)
        else:
            return qs

    def get_readonly_fields(self, request, obj=None):
        if obj and request.user.user_type == CONST_TYPE_STUDENT:
            return self.readonly_fields + ('subject', )
        else:
            return self.readonly_fields 
    

@admin.register(AttendanceData)
class AttendanceDatadmin(admin.ModelAdmin):

    filter_horizontal = ('students_attended',)

    def get_form(self, request, obj=None, **kwargs):
        form = super().get_form(request, obj, **kwargs)
        form.base_fields['students_attended'].widget.can_add_related = False
        form.base_fields['students_attended'].widget.can_delete_related = False
        form.base_fields['students_attended'].widget.can_change_related = False
        return form

    def formfield_for_manytomany(self, db_field, request, **kwargs):
        if db_field.name == "students_attended":
            kwargs["queryset"] = Student.objects.filter(section=request.user)
        return super().formfield_for_manytomany(db_field, request, **kwargs)

app_config = apps.get_app_config('fireapp') # Replace your_app_name it is just a placeholder
models = app_config.get_models()

for model in models:
    try:
        admin.site.register(model)
    except admin.sites.AlreadyRegistered:
        pass