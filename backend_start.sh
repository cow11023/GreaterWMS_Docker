#!/bin/bash
python manage.py makemigrations
python manage.py migrate
#daphne -b 0.0.0.0 -p 8008 greaterwms.asgi:application
