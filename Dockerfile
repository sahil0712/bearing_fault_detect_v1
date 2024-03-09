FROM python:3.7-slim

MAINTAINER Kshitiz Bansal "kshitiz.a.bansal@capgemini.com"

ADD ./app /app

RUN apt-get update
RUN apt-get install 'ffmpeg'\
    'libsm6'\ 
    'libxext6'  -y
RUN pip install --upgrade pip
RUN pip install -r /app/requirements.txt

WORKDIR app

CMD ["python", "main.py"]

###########################################

# Use an official Python runtime as a parent image
FROM python:3.9-slim-buster

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --trusted-host pypi.python.org -r requirements.txt

# Make port 80 available to the world outside this container
EXPOSE 80

# Define environment variable
ENV NAME yolov5

# Run app.py when the container launches
CMD ["python", "main.py"]
