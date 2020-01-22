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
RUN pip install -r /tmp/requirements.txt

# CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 app:app --reload
CMD python main.py