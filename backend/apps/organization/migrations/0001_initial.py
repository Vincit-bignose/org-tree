# Generated by Django 5.0.3 on 2024-05-16 06:12

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Company',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100, verbose_name='Имя компании')),
                ('description', models.TextField(blank=True, verbose_name='Краткое описание')),
                ('headquarters_location', models.CharField(blank=True, max_length=255, verbose_name='Расположение головного офиса')),
                ('logo', models.ImageField(blank=True, upload_to='images/company_logos/')),
            ],
            options={
                'verbose_name': 'Компания',
                'verbose_name_plural': 'Компании',
            },
        ),
        migrations.CreateModel(
            name='Department',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=255, verbose_name='Название отдела')),
                ('description', models.TextField(blank=True, verbose_name='Краткое описание')),
                ('company', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='departments', to='organization.company', verbose_name='Компания')),
                ('parent_department', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='child_departments', to='organization.department', verbose_name='Вышестоящий отдел')),
            ],
            options={
                'verbose_name': 'Отдел',
                'verbose_name_plural': 'Отделы',
            },
        ),
        migrations.CreateModel(
            name='Employee',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('last_name', models.CharField(max_length=100, verbose_name='Фамилия')),
                ('first_name', models.CharField(max_length=100, verbose_name='Имя')),
                ('surname', models.CharField(blank=True, max_length=100, verbose_name='Отчество')),
                ('email', models.EmailField(blank=True, max_length=254)),
                ('phone1', models.CharField(blank=True, max_length=30, verbose_name='Телефон')),
                ('phone2', models.CharField(blank=True, max_length=30, verbose_name='Телефон доп.')),
                ('photo', models.ImageField(blank=True, upload_to='images/employees_photos/', verbose_name='Фотография')),
                ('position', models.CharField(blank=True, max_length=255, verbose_name='Должность')),
                ('schedule', models.CharField(blank=True, max_length=255, verbose_name='График работы')),
                ('address', models.CharField(blank=True, max_length=255, verbose_name='Адрес')),
                ('departments', models.ManyToManyField(related_name='employees', to='organization.department', verbose_name='Отделы')),
            ],
            options={
                'verbose_name': 'Сотрудник',
                'verbose_name_plural': 'Сотрудники',
            },
        ),
        migrations.AddField(
            model_name='department',
            name='responsible',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='responsible_departments', to='organization.employee', verbose_name='Ответственный'),
        ),
        migrations.AddField(
            model_name='department',
            name='supervisor',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='supervised_departments', to='organization.employee', verbose_name='Руководитель'),
        ),
    ]