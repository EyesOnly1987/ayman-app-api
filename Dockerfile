#find an image hub.docker.
# alpine is a lightwight of docker
FROM python:3.7-alpine

MAINTAINER AYMAN DEV LTD
#tells pythom in unbuffred mode. this donst allow python to buffer the outputs
ENV PYTHONUNBUFFERED 1

# here are our dependencies
COPY ./requirements.txt /requirements.txt
RUN pip install -r requirements.txt

#we will make a directory within the image to store the src code
#creates a empty folder on or image calles /app
RUN mkdir /app
#switch that to the default directory
WORKDIR /app
#copies from local machine to image directory
COPY ./app /app

#create a user who will run app image
RUN adduser -D user
#switch to that user
USER user
