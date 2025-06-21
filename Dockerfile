FROM ubuntu:latest
MAINTAINER Tuan Thai "tuanthai@example.com"
RUN apt update -y
RUN apt install -y python3-pip python3-dev build-essential bash
ADD . /flask_app
WORKDIR /flask_app
RUN pip3 install --break-system-packages -r requirements.txt
RUN sed -i 's/from werkzeug.urls import url_quote/from urllib.parse import quote as url_quote/' /usr/local/lib/python3.12/dist-packages/flask/app.py
#ENTRYPOINT ["python3"]
CMD ["python3","flask_docker.py"]
