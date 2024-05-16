from django.db import models


class Company(models.Model):

    class Meta:
        verbose_name = "Компания"
        verbose_name_plural = "Компании"

    name = models.CharField(max_length=100, verbose_name="Имя компании")
    description = models.TextField(blank=True, verbose_name="Краткое описание")
    headquarters_location = models.CharField(
        blank=True, max_length=255, verbose_name="Расположение головного офиса"
    )
    logo = models.ImageField(upload_to="images/company_logos/", blank=True)

    def __str__(self):
        return self.name


class Department(models.Model):

    class Meta:
        verbose_name = "Отдел"
        verbose_name_plural = "Отделы"

    name = models.CharField(max_length=255, verbose_name="Название отдела")
    description = models.TextField(blank=True, verbose_name="Краткое описание")
    company = models.ForeignKey(
        Company,
        on_delete=models.CASCADE,
        related_name="departments",
        verbose_name="Компания",
    )
    supervisor = models.ForeignKey(
        "Employee",
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        related_name="supervised_departments",
        verbose_name="Руководитель",
    )
    responsible = models.ForeignKey(
        "Employee",
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        related_name="responsible_departments",
        verbose_name="Ответственный",
    )
    parent_department = models.ForeignKey(
        "self",
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        related_name="child_departments",
        verbose_name="Вышестоящий отдел",
    )

    def __str__(self):
        return f"{self.company.name} - {self.name}"


class Employee(models.Model):

    class Meta:
        verbose_name = "Сотрудник"
        verbose_name_plural = "Сотрудники"

    last_name = models.CharField(max_length=100, verbose_name="Фамилия")
    first_name = models.CharField(max_length=100, verbose_name="Имя")
    surname = models.CharField(max_length=100, verbose_name="Отчество", blank=True)
    email = models.EmailField(blank=True)
    phone1 = models.CharField(max_length=30, verbose_name="Телефон", blank=True)
    phone2 = models.CharField(max_length=30, verbose_name="Телефон доп.", blank=True)
    photo = models.ImageField(
        upload_to="images/employees_photos/", blank=True, verbose_name="Фотография"
    )
    departments = models.ManyToManyField(
        Department, related_name="employees", verbose_name="Отделы"
    )
    position = models.CharField(max_length=255, verbose_name="Должность", blank=True)
    schedule = models.CharField(
        max_length=255, verbose_name="График работы", blank=True
    )
    address = models.CharField(max_length=255, verbose_name="Адрес", blank=True)

    def __str__(self):
        return f"{self.last_name} {self.first_name} {self.surname}"
