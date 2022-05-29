# Generated by Django 4.0.4 on 2022-05-29 13:32

import django.core.validators
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('fireapp', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='student',
            name='current_semester',
            field=models.IntegerField(default=1, validators=[django.core.validators.MaxValueValidator(4), django.core.validators.MinValueValidator(1)]),
        ),
        migrations.AddField(
            model_name='student',
            name='current_year',
            field=models.IntegerField(default=1, validators=[django.core.validators.MaxValueValidator(6), django.core.validators.MinValueValidator(1)]),
        ),
    ]
