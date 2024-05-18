FROM python

MAINTAINER invadersriram2002@gmail.com

WORKDIR app

COPY requirements.txt requirements.txt
COPY src src

RUN pip install -r requirements.txt

EXPOSE 8000
CMD ["gunicorn", "-b", "0.0.0.0:8000", "src.app:app", "--workers=5"]
