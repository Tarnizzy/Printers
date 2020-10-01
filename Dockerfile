FROM python:3
ENV PYTHONUNBUFFERED 1
RUN mkdir /code1
WORKDIR /code1
COPY requirements.txt /code1/
RUN pip install -r requirements.txt


EXPOSE 8000

CMD python3 manage.py runserver 0.0.0.0:8000


COPY . .



