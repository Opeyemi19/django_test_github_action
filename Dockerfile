###########
# BUILDER #
###########

# pull official base image
FROM python:3.8-slim-buster as builder

# set work directory
WORKDIR /usr/src/app

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# lint
RUN pip install --upgrade pip

COPY . .

# install dependencies
COPY ./requirements.txt .
RUN pip wheel --no-cache-dir --no-deps --wheel-dir /usr/src/app/wheels -r requirements.txt


#########
# FINAL #
#########

# pull official base image
FROM python:3.8-slim-buster

# create directory for the app user
RUN mkdir -p /home/app

# create the app user
RUN addgroup --system prodjangotest && adduser --system --group prodjangotest

# create the appropriate directories
ENV HOME=/home/app
ENV APP_HOME=$HOME/web
RUN mkdir $APP_HOME
RUN mkdir $APP_HOME/staticfiles
RUN mkdir $APP_HOME/mediafiles
WORKDIR $APP_HOME

# install dependencies
COPY --from=builder /usr/src/app/wheels /wheels
COPY --from=builder /usr/src/app/requirements.txt .
RUN pip install --no-cache /wheels/*

# copy project
COPY . $APP_HOME

# chown all the files to the app user
RUN chown -R prodjangotest:prodjangotest $APP_HOME

# change to the app user
USER prodjangotest

# Run makemigrations and migrate
RUN python manage.py migrate --noinput

# Collect all static
# RUN python manage.py collectstatic --noinput

# CMD ["gunicorn", "core.wsgi", "--bind", "0.0.0.0:8000"]

CMD python manage.py runserver 0.0.0.0:8000