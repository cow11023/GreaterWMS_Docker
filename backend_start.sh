#!/bin/bash
python3 manage.py makemigrations
python3 manage.py migrate
<<<<<<< Updated upstream
#daphne -b 0.0.0.0 -p 8008 greaterwms.asgi:application
=======
daphne -b 0.0.0.0 -p 8008 greaterwms.asgi:application
>>>>>>> Stashed changes
