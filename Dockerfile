# Use a minimal, verified Python image
FROM python:3.11-slim

# Create a non-root user
RUN useradd -m appuser

# Set working directory
WORKDIR /app

# Copy requirements and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy app code
COPY app.py .

# Change ownership and switch to non-root user
RUN chown -R appuser:appuser /app
USER appuser

# Run FastAPI on non-privileged port
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]
