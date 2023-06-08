# Base image
FROM python:3.11

# Set working directory
WORKDIR /app

# Copy application files to the container
COPY . .

# Update all packages
RUN apt-get update && apt-get upgrade -y && apt-get autoremove -y && apt-get clean

# Install required packages
RUN pip install -U pip && pip install -r requirements.txt

# Expose port 5000
EXPOSE 5000

# Set environment variables for database configuration
ENV DB_USER=user
ENV DB_PASS=password
ENV DB_HOST=db
ENV DB_NAME=temperature

# Set environment variables for flask app configuration
ENV SECRET_KEY=your-secret-key
ENV STUDENT="Kevin Furjan"
ENV COLLEGE="University College Algebra"

# Configure the correct command to start the flask application
CMD ["flask", "run", "--debug"]
