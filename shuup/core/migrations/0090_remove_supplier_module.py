# Generated by Django 2.2.19 on 2021-05-27 17:07

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('shuup', '0089_move_to_multiple_modules'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='supplier',
            name='module_identifier',
        ),
    ]
