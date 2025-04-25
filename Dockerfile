# Use Python 3.10 image as base
FROM python:3.10

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . .

# Install the required dependencies from requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port the app will run on (if applicable)
EXPOSE 5000

# Set the command to run your application
CMD ["python", "app.py"]

