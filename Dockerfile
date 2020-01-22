# Use the official Python image.
# https://hub.docker.com/_/python
FROM python:3.7-slim

# Copy local code to the container image.
ENV APP_HOME /app
WORKDIR $APP_HOME
COPY requirements.txt /tmp/requirements.txt
COPY ./app /app
COPY ./config /config

# Install production dependencies.
RUN pip install --upgrade pip && pip install -r /tmp/requirements.txt

ENV PORT 8888
ENV GOOGLE_APPLICATION_CREDENTIALS /config/cyberagent-349-5ffc6c6724f8.json

# PRODUCTION
# CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 main:app --reload
# DEBUG
CMD python main.py