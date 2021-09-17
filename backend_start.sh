#!/bin/bash
<<<<<<< Updated upstream
python3 manage.py makemigrations
python3 manage.py migrate
<<<<<<< Updated upstream
#daphne -b 0.0.0.0 -p 8008 greaterwms.asgi:application
=======
daphne -b 0.0.0.0 -p 8008 greaterwms.asgi:application
>>>>>>> Stashed changes
=======
python manage.py makemigrations
python manage.py migrate
#daphne -b 0.0.0.0 -p 8008 greaterwms.asgi:application
>>>>>>> Stashed changes
