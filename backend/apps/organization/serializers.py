from rest_framework import serializers
from apps.organization.models import Company, Employee, Department


class CompanySerialazer(serializers.ModelSerializer):
    class Meta:
        model = Company
        fields = ("id", "name", "description", "headquarters_location", "logo")


class EmployeeBaseSerializer(serializers.ModelSerializer):
    class Meta:
        model = Employee
        fields = [
            "id",
            "last_name",
            "first_name",
            "photo",
            "position",
        ]


class EmployeeDetailSerializer(EmployeeBaseSerializer):
    class Meta(EmployeeBaseSerializer.Meta):
        fields = EmployeeBaseSerializer.Meta.fields + [
            "surname",
            "email",
            "phone1",
            "phone2",
            "schedule",
            "address",
        ]


class RecursiveSerializer(serializers.Serializer):

    def to_representation(self, instance):
        serializer = DepartmentSerializer(instance, context=self.context)
        return serializer.data


class FilterListSerializer(serializers.ListSerializer):
    def to_representation(self, data):
        data = data.filter(parent_department=None)
        return super().to_representation(data)


class DepartmentSerializer(serializers.ModelSerializer):

    supervisor = EmployeeBaseSerializer()
    responsible = EmployeeBaseSerializer()
    child_departments = RecursiveSerializer(many=True)
    employees = EmployeeBaseSerializer(many=True)

    class Meta:
        list_serializer_class = FilterListSerializer
        model = Department
        fields = (
            "id",
            "name",
            "description",
            "supervisor",
            "responsible",
            "employees",
            "child_departments",
        )
