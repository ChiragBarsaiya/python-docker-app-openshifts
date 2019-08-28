# Use an official Python runtime as a parent image
FROM python:latest

MAINTAINER MANIVANNAN.C

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
ADD . /app

# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt
# Make port 80 available to the world outside this container
EXPOSE 6000

# Define environment variable
ENV NAME TB1

# Run app.py when the container launches
CMD ["python", "app.py"]
