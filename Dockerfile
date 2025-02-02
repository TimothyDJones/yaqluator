FROM python:3.9-alpine

# Set the working directory (application base directory).
RUN mkdir -p /var/www/yaqluator.com
WORKDIR /var/www/yaqluator.com

# Environment variables
# Don't save .pyc files - Same as "python -B"
ENV PYTHONDONTWRITEBYTECODE 1
# Prevent buffering of stdout and stderr - Same as "python -u"
ENV PYTHONUNBUFFERED 1

# Install application dependencies from "requirements.txt"
RUN pip install --upgrade pip
COPY ./requirements.txt /var/www/yaqluator.com/requirements.txt
RUN pip install --no-cache-dir -r /var/www/yaqluator.com/requirements.txt
# Install Gunicorn WSGI HTTP server requirement for web service.
RUN pip install --no-cache-dir gunicorn==20.1.0
