FROM python:3.11

WORKDIR /app

COPY . .

# Update all packages
RUN apt-get update && apt-get upgrade -y && apt-get autoremove -y && apt-get clean

# Install required Python packages
RUN pip install -U pip && pip install -r requirements.txt

# Expose port 5000
EXPOSE 5000

# command to start the flask application
CMD ["flask", "run", "--host=0.0.0.0", "-p 5000"]
