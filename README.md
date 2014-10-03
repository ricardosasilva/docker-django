# Django

Docker image with Django Nginx, uWSGI, rsyslog and supervisor

# Docker parent images

- salamandra/nginx
- salamandra/rsyslog
- dockerfile/supervisor

# Definitions

    Default app path: /data/app/
    STATIC_ROOT: /data/static/

# How to use

Run this image mounting a volume with the app on /data/app/ or use as base to build your own image.

    $ docker run -d -e DJANGO_SETTINGS_MODULE=yourapp.settings -e WSGI_FILE=yourapp.wsgi -e INSTALL_REQUIREMENTS=True -p 80:80 -v /path/to/your/code:/data/app/ salamandra/django

Params:

    DJANGO_SETTINGS_MODULE: The path to your settings (Required)
    WSGI_FILE: the path to wsgi file (Required)
    INSTALL_REQUIREMENTS: Run pip install with 'requirements.txt' on project root (Optional) 

