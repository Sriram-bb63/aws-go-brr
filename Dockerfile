# FROM pyth

# WORKDIR app

# COPY . ./

# RUN apt update -y

# RUN apt install python3-pip -y

# RUN pip install -r requirements.txt

# EXPOSE 5000

# CMD ["python3", "test.py"]


FROM ubuntu

MAINTAINER invadersriram2002@gmail.com

RUN apt update -y
RUN apt install python3-pip -y
RUN apt install gunicorn3 -y
RUN apt install python3-venv -y

WORKDIR app

COPY requirements.txt requirements.txt
COPY src src

RUN python3 -m venv venv
RUN source venv/scripts/activate

RUN pip3 install -r requirements.txt

EXPOSE 8000

CMD ["gunicorn3", "-b", "0.0.0.0:8000", "src.app:app", "--workers=5"]
