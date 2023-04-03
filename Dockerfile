FROM python:3.9.0

WORKDIR /home/

RUN echo "testing1234"

RUN git clone https://github.com/javascriptKR/Django.git

WORKDIR /home/yZqreLvJRyg8D3kp8l/

RUN pip install -r requirements.txt

RUN pip install gunicorn

RUN pip install mysqlclient

EXPOSE 8000

CMD ["bash", "-c", "python manage.py collectstatic --noinput & python manage.py migrate --settings=yZqreLvJRyg8D3kp8l.settings.deploy & gunicorn yZqreLvJRyg8D3kp8l.wsgi --env DJANGO_SETTINGS_MODULE=yZqreLvJRyg8D3kp8l.settings.deploy --bind 0.0.0.0:8000"]