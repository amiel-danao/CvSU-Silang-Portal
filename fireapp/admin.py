from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from django.apps import apps
from django.http import HttpResponseRedirect
from django.urls import reverse
from fireapp.managers import CustomUserManager
from fireapp.models import (
    ADMIN_TYPE,
    CONST_TYPE_ADMIN,
    CONST_TYPE_STUDENT,
    CONST_TYPE_TEACHER,
    STUDENT_TYPE,
    TEACHER_TYPE,
    Course,
    Department,
    Grade,
    Section,
    Subject,
    Student,
    Teacher,
    Quiz,
    QuizData,
)
from django.contrib.auth import get_user_model
from .forms import CustomUserChangeForm, CustomUserCreateBaseForm
from import_export import resources
from import_export.admin import ImportExportModelAdmin, ImportMixin
from django.core.exceptions import ObjectDoesNotExist
from openpyxl import load_workbook
import openpyxl
from django.contrib.auth import get_user_model
from django.core.exceptions import PermissionDenied
from django.views.decorators.http import require_POST
from django.utils.encoding import force_str
from django.utils.decorators import method_decorator
from io import BytesIO


CustomUser = get_user_model()
GRADE_WORKSHEET = "RAW GRADES"
SEMESTRAL_WORKSHEET = "SEMESTRAL GRADE"
EXCEL_ROW_START_OFFSET = 10
EXCEL_COL_START_OFFSET = 2
SCHOOL_YEARS_SEMESTER = ("", "FIRST", "SECOND", "THIRD", "FOURTH", "FIFTH")
EXEMPTED_MODELS = (Quiz, QuizData)


@admin.register(Course)
class CourseAdmin(admin.ModelAdmin):
    model = Course
    list_display = (
        "id",
        "course_abbr",
        "course_name",
        "get_department_name",
        "course_credit",
    )
    list_editable = ["course_credit"]
    filter_horizontal = ("subjects",)

    @admin.display(description="Department Name", ordering="department__name")
    def get_department_name(self, obj):
        if obj.course_department is not None:
            return obj.course_department.name
        else:
            return ''

    def save_related(self, request, form, formsets, change):
        obj = form.instance
        print(request)
        print(form)
        obj.save()
        super().save_related(request, form, formsets, change)


class StudentInline(admin.StackedInline):
    model = Student
    can_delete = False


@admin.register(Teacher)
class CustomTeacherAdmin(admin.ModelAdmin):
    model = Teacher
    list_display = (
        "get_teacher_name",
        "teacher_id",
        "department",
    )
    readonly_fields = ("user", "get_teacher_name")
    filter_horizontal = ("sections", "subjects")

    sortable_by = ("teacher_id" "department",)

    fieldsets = (
        (
            None,
            {
                "fields": (
                    "user",
                    "get_teacher_name",
                    "teacher_id",
                    "department",
                    "sections",
                    "subjects",
                )
            },
        ),
    )

    def get_teacher_name(self, obj):
        return obj.user.first_name + " " + obj.user.last_name

    get_teacher_name.admin_order_field = "Teacher"
    get_teacher_name.short_description = "Teacher Name"

    def get_queryset(self, request):
        qs = super().get_queryset(request)
        if request.user.user_type == CONST_TYPE_TEACHER:
            return qs.filter(user=request.user)
        else:
            return qs

    def changelist_view(self, request, extra_context=None):
        if request.user.user_type == CONST_TYPE_TEACHER:
            user = request.user
            return HttpResponseRedirect(
                reverse(
                    "admin:%s_%s_change"
                    % (self.model._meta.app_label, self.model._meta.model_name),
                    args=(user.id,),
                )
            )
        return super().changelist_view(request=request, extra_context=extra_context)


@admin.register(Student)
class CustomStudentAdmin(admin.ModelAdmin):
    model = Student
    list_display = (
        "get_student_name",
        "scholar_no",
        "section",
        "current_year",
        "current_semester",
    )
    list_filter = ("section",)
    search_fields = ("scholar_no",)
    readonly_fields = ("student_email", "get_student_name")

    sortable_by = (
        "scholar_no",
        "section",
        "current_year",
        "current_semester",
    )

    fieldsets = (
        (
            None,
            {
                "fields": (
                    "scholar_no",
                    "student_email",
                    "get_student_name",
                    "section",
                    "current_year",
                    "current_semester",
                    "mobile",
                    "parents_mobile",
                    "home_address",
                )
            },
        ),
    )

    def student_email(self, obj):
        return obj.user.email

    def get_student_name(self, obj):
        return obj.user.first_name + " " + obj.user.last_name

    get_student_name.admin_order_field = "Student"  # Allows column order sorting
    get_student_name.short_description = "Student Name"  # Renames column head

    def changelist_view(self, request, extra_context=None):
        if request.user.user_type == CONST_TYPE_STUDENT:
            user = request.user
            return HttpResponseRedirect(
                reverse(
                    "admin:%s_%s_change"
                    % (self.model._meta.app_label, self.model._meta.model_name),
                    args=(user.id,),
                )
            )
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
            return self.readonly_fields + ("section", "scholar_no")
        else:
            return self.readonly_fields


@admin.register(CustomUser)
class CustomUserAdmin(UserAdmin):
    add_form = CustomUserCreateBaseForm
    form = CustomUserChangeForm
    ordering = ("email",)
    list_display = (
        "uid",
        "email",
        "first_name",
        "last_name",
        "_user_type",
        "is_active",
    )
    list_filter = (
        "user_type",
        "is_active",
    )
    search_fields = ("uid", "email", "first_name", "last_name")
    filter_horizontal = (
        "groups",
        "user_permissions",
    )
    # inlines = []
    exclude = ("is_superuser", "last_login", "date_joined")
    readonly_fields = ("_user_type",)

    def get_queryset(self, request):
        qs = super().get_queryset(request)
        if request.user.user_type == CONST_TYPE_TEACHER:
            return qs.exclude(user_type=CONST_TYPE_ADMIN)
        elif request.user.user_type == CONST_TYPE_STUDENT:
            return qs.filter(id=request.user.id)
        else:
            return qs

    fieldsets = (
        ("User Information", {"fields": ("email", "_user_type")}),
        (
            "Personal Information",
            {
                "fields": (
                    "first_name",
                    "last_name",
                    "middle_name",
                    "birth_date",
                    "gender",
                )
            },
        ),
        ("Permissions", {"fields": ("is_active", "groups", "user_permissions")}),
    )

    add_fieldsets = (
        (
            "User Information",
            {
                "classes": ("wide",),
                "fields": (
                    "uid",
                    "email",
                    "password1",
                    "password2",
                    "user_type",
                    "is_active",
                ),
            },
        ),
        (
            "Personal Information",
            {
                "classes": ("wide",),
                "fields": (
                    "first_name",
                    "last_name",
                    "middle_name",
                    "birth_date",
                    "gender",
                ),
            },
        ),
    )

    def _user_type(self, obj):
        return dict(ADMIN_TYPE + TEACHER_TYPE + STUDENT_TYPE)[int(obj.user_type)]

    def changelist_view(self, request, extra_context=None):
        if request.user.user_type == CONST_TYPE_STUDENT:
            user = request.user
            return HttpResponseRedirect(
                reverse(
                    "admin:%s_%s_change"
                    % (self.model._meta.app_label, self.model._meta.model_name),
                    args=(user.id,),
                )
            )
        return super().changelist_view(request=request, extra_context=extra_context)

    # def get_form(self, request, obj=None, **kwargs):

    # if not obj:
    #    if request.user.user_type == str(CONST_TYPE_ADMIN):
    #        return CustomAdminUserCreationForm
    #    return super().get_form(request, obj, **kwargs)

    def get_readonly_fields(self, request, obj=None):
        if obj and not request.user.user_type == CONST_TYPE_ADMIN:
            # We are adding an object
            return self.readonly_fields + ("user_permissions", "groups", "is_active")
        else:
            return self.readonly_fields

    def formfield_for_choice_field(self, db_field, request, **kwargs):
        if db_field.name == "user_type":
            if request.user.user_type == CONST_TYPE_ADMIN:
                kwargs["choices"] = ADMIN_TYPE + TEACHER_TYPE
            if request.user.user_type == CONST_TYPE_TEACHER:
                kwargs["choices"] = STUDENT_TYPE

        return super().formfield_for_choice_field(db_field, request, **kwargs)

    # def get_exclude(self, request, obj=None):
    #    if obj and not request.user.user_type == CONST_TYPE_ADMIN:
    #        return ('user_permissions', 'groups') + super().get_exclude(request, obj)

    #    return super().get_exclude(request, obj)

    def save_model(self, request, obj, form, change):
        obj.is_superuser = obj.user_type == CONST_TYPE_ADMIN
        obj.is_staff = 1
        obj.save()


# @admin.register(QuizData)
# class QuizDataAdmin(admin.ModelAdmin):
#     def get_form(self, request, obj=None, **kwargs):
#         form = super().get_form(request, obj, **kwargs)
#         form.base_fields["student"].widget.can_add_related = False
#         form.base_fields["student"].widget.can_delete_related = False
#         form.base_fields["student"].widget.can_change_related = False
#         return form


# @admin.register(Quiz)
# class QuizAdmin(admin.ModelAdmin):
#     filter_horizontal = ("quiz_datas",)

#     def has_module_permission(self, request):
#         return not request.user.is_superuser


@admin.register(Subject)
class SubjectAdmin(admin.ModelAdmin):
    list_display = ("subject_name", "unit")
    list_filter = ("subject_name", "unit")


@admin.register(Department)
class DepartmentAdmin(admin.ModelAdmin):
    readonly_fields = [
        "teachers",
    ]

    def teachers(self, obj):
        # this_section = Section.objects.get(id=object_id)
        this_teachers = Teacher.objects.filter(department=obj)
        result = list()
        for teacher in this_teachers:
            result.append(
                f"{teacher.teacher_id} - {teacher.user.last_name} \
                {teacher.user.first_name}"
            )
        return "\n".join(result)

    teachers.admin_order_field = "Teachers"  # Allows column order sorting
    teachers.short_description = "Teachers"  # Renames column head


@admin.register(Section)
class SectionAdmin(admin.ModelAdmin):

    readonly_fields = [
        "students",
    ]

    def students(self, obj):
        # this_section = Section.objects.get(id=object_id)
        this_students = Student.objects.filter(section=obj)
        result = list()
        for student in this_students:
            result.append(
                f"{student.scholar_no} - {student.user.last_name} \
                {student.user.first_name}"
            )
        return "\n".join(result)

    students.admin_order_field = "Students"  # Allows column order sorting
    students.short_description = "Students"  # Renames column head


class GradeResource(resources.ModelResource):
    class Meta:
        model = Grade
        fields = (
            "id",
            "average",
            "grade",
            "student",
        )
        skip_unchanged = True
        report_skipped = False


@admin.register(Grade)
class GradeAdmin(ImportMixin, admin.ModelAdmin):
    resource_class = GradeResource
    list_display = (
        "student",
        "grade",
        "average",
        "subject",
        "student_year",
        "student_semester",
    )
    list_filter = (
        "student",
        "subject",
        "student_year",
        "student_semester",
    )

    def has_import_permission(self, request):
        if request.user.user_type == CONST_TYPE_STUDENT:
            return False
        return True

    def get_queryset(self, request):
        qs = super().get_queryset(request)
        if request.user.user_type == CONST_TYPE_STUDENT:
            this_student = Student.objects.get(user=request.user)
            return qs.filter(student=this_student)
        else:
            return qs

    def get_readonly_fields(self, request, obj=None):
        if obj and request.user.user_type == CONST_TYPE_STUDENT:
            return self.readonly_fields + ("subject",)
        else:
            return self.readonly_fields

    @method_decorator(require_POST)
    def process_import(self, request, *args, **kwargs):
        """
        Perform the actual import action (after the user has confirmed the import)
        """
        if not self.has_import_permission(request):
            raise PermissionDenied

        form_type = self.get_confirm_import_form()
        confirm_form = form_type(request.POST)
        if confirm_form.is_valid():
            import_formats = self.get_import_formats()
            input_format = import_formats[
                int(confirm_form.cleaned_data["input_format"])
            ]()
            tmp_storage = self.get_tmp_storage_class()(
                name=confirm_form.cleaned_data["import_file_name"]
            )
            data = tmp_storage.read(input_format.get_read_mode())
            if not input_format.is_binary() and self.from_encoding:
                data = force_str(data, self.from_encoding)
            dataset = input_format.create_dataset(data)

            workbook = load_workbook(
                filename=BytesIO(data), read_only=True, data_only=True
            )

            self.process_excel(workbook)

            result = self.process_dataset(
                dataset, confirm_form, request, *args, **kwargs
            )

            tmp_storage.remove()

            return self.process_result(result, request)

    def process_excel(self, workbook):
        semestral_worksheet = workbook.get_sheet_by_name(SEMESTRAL_WORKSHEET)
        grades_worksheet = workbook.get_sheet_by_name(GRADE_WORKSHEET)

        year = 1
        semester = 1
        try:
            school_year = str(semestral_worksheet.cell(row=17, column=3).value).upper()
            year = SCHOOL_YEARS_SEMESTER.index(school_year.split(" ")[0])
            school_semester = semestral_worksheet.cell(row=19, column=3).value
            semester = SCHOOL_YEARS_SEMESTER.index(school_semester.split(" ")[0])
        except IndexError:
            pass

        data = []

        for row in grades_worksheet.iter_rows(
            min_row=EXCEL_ROW_START_OFFSET, min_col=EXCEL_COL_START_OFFSET
        ):  # Offset for header
            grade = Grade()
            scholar_no = None
            try:
                scholar_no = row[0].value
            except Exception:
                pass
            if scholar_no is None or not scholar_no:
                continue

            student = Student.objects.filter(scholar_no=scholar_no).first()
            if student is None:
                User = get_user_model()
                user = User.objects.create_student(uid=scholar_no, password=scholar_no)
                if user is None:
                    continue
                full_name = row[1].value.strip().split(",")
                user.last_name = full_name[0]
                middle_initial = full_name[1][-2] if full_name[1][-1] == "." else ""
                user.first_name = full_name[1].replace(f"{middle_initial}.", "").strip()
                user.middle_name = middle_initial
                user.save()
                student = Student.objects.get(user=user)

            if student is None:
                continue

            grade.student = student
            grade.student.scholar_no = scholar_no

            grade.student.save()
            grade.student_year = year
            grade.student_semester = semester
            try:
                average = row[113].value
                grade.average = round(average, 2)
                grade.grade = row[114].value
            except IndexError:
                pass
            data.append(grade)

        # Bulk create data
        Grade.objects.bulk_create(data)


app_config = apps.get_app_config("fireapp")
models = app_config.get_models()

for model in models:
    if model.__class__ in EXEMPTED_MODELS:
        continue
    try:
        admin.site.register(model)
    except admin.sites.AlreadyRegistered:
        pass

admin.site.unregister(Quiz)
admin.site.unregister(QuizData)
