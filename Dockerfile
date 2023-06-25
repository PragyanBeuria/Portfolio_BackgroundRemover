# Base Image
FROM python:3.9
RUN pip install --upgrade pip
# Install necessary system packages
RUN apt-get update && apt-get install -y libgl1-mesa-glx
# Copy your application code
COPY . /app
# Set the working directory
WORKDIR /app
# Install Python dependencies
RUN pip install -r requirements.txt
# Expose the necessary port
EXPOSE 8000
# Start the application
CMD gunicorn -b 0.0.0.0:8000 app:app