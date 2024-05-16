from django.http import Http404
from rest_framework.views import APIView
from rest_framework.generics import ListAPIView
from rest_framework.response import Response

# from rest_framework import status
from apps.organization.serializers import (
    CompanySerialazer,
    DepartmentSerializer,
    EmployeeDetailSerializer,
)
from .models import Company, Employee, Department


class CompanyList(APIView):
    """
    Class for retrieving a list of all companies.
    """

    def get(self, request, format=None):
        """
        Handles HTTP GET requests and returns a list of all companies.
        """

        companies = Company.objects.all()
        serializer = CompanySerialazer(companies, many=True)
        return Response(serializer.data)


class EmployeeDetail(APIView):

    def get_object(self, pk):
        try:
            return Employee.objects.get(pk=pk)
        except Employee.DoesNotExist:
            raise Http404

    def get(self, request, pk, format=None):
        employee = self.get_object(pk)
        serializer = EmployeeDetailSerializer(employee)
        return Response(serializer.data)


class DepartmentList(ListAPIView):
    serializer_class = DepartmentSerializer

    def get_queryset(self):
        try:
            company = Company.objects.get(pk=self.kwargs["pk"])
            queryset = company.departments.all()
            if queryset.exists():
                return queryset
            else:
                raise Http404("Отделы для этой компании не найдены.")
        except Company.DoesNotExist:
            raise Http404("Компания не найдена.")
