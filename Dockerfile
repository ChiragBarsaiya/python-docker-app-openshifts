# Use an official Python runtime as a parent image
FROM python:latest

MAINTAINER MANIVANNAN.C

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
ADD . /app

# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt

# Install python newrelic agent on this docker image
RUN pip install newrelic

# Make port 80 available to the world outside this container
EXPOSE 6000

# Define environment variable
ENV NAME ITRAIN-BATMAN

#When you launch the container, it runs the script and then exits
ENTRYPOINT ["newrelic-admin", "run-program"]

#Default environment variables
ENV NEW_RELIC_LOG=stderr \
    NEW_RELIC_LOG_LEVEL=info \
    NEW_RELIC_ENABLED=true

# Run app.py when the container launches
CMD ["python", "app.py"]
