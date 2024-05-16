from django.contrib import admin
from .models import Company, Department, Employee


class CompanyAdmin(admin.ModelAdmin):
    list_display = ("name", "description")


class DepartmentAdmin(admin.ModelAdmin):
    list_display = ("name", "company", "description", "supervisor", "responsible")
    list_filter = ("company",)
    search_fields = ("name", )

    def formfield_for_foreignkey(self, db_field, request, **kwargs):
        if db_field.name == "supervisor" or db_field.name == "responsible":
            current_department_id = request.resolver_match.kwargs.get("object_id")
            if current_department_id:
                current_department = Department.objects.get(pk=current_department_id)
                kwargs["queryset"] = current_department.employees.all()
        return super().formfield_for_foreignkey(db_field, request, **kwargs)


class EmployeeAdmin(admin.ModelAdmin):
    list_display = ("__str__", "phone1", "get_departments", "position")
    list_filter = ("departments",)
    search_fields = ("__str__", "departments", )

    def get_departments(self, obj):
        return ", ".join([str(d) for d in obj.departments.all()])

    get_departments.short_description = "Отделы"


admin.site.register(Company, CompanyAdmin)
admin.site.register(Department, DepartmentAdmin)
admin.site.register(Employee, EmployeeAdmin)
