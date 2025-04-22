#dockerfile for flask calculator app

FROM python:3.8-slim-buster
RUN apt-get update -y

EXPOSE 5000

COPY . /app
COPY templates /app

WORKDIR /app

RUN pip3 install -r requirements.txt

CMD ["python3", "GeometryCalcWeb.py"]