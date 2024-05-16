from django.urls import path
from rest_framework.urlpatterns import format_suffix_patterns
from apps.organization.views import CompanyList, EmployeeDetail, DepartmentList

urlpatterns = [
    path("companies/", CompanyList.as_view()),
    path("company/<int:pk>/", DepartmentList.as_view()),
    path("employee/<int:pk>/", EmployeeDetail.as_view()),
]
urlpatterns = format_suffix_patterns(urlpatterns)
