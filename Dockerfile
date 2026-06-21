# Step 1: Use an official, secure, minimal base image
FROM python:3.11-slim

# Step 2: Set the internal working environment
WORKDIR /app

# Step 3: Create a locked-down, non-root system user
RUN groupadd -r appgroup && useradd -r -g appgroup -d /app -s /sbin/nologin appuser

# Step 4: Copy dependency lists first to maximize Docker layer caching
COPY src/requirements.txt .

# Step 5: Install python dependencies as root
RUN pip install --no-cache-dir -r requirements.txt

# Step 6: Explicitly copy ONLY production runtime application code (Excluding tests!)
COPY src/app.py .

# Step 7: Secure filesystem permissions by giving ownership to our user
RUN chown -R appuser:appgroup /app

# Step 8: Document the runtime contract port for engineering clarity
EXPOSE 5000

# Step 9: Drop root privileges completely
USER appuser

# Step 10: Launch the application process securely
CMD ["python", "app.py"]
