FROM python:3.9

# Create a non-root user
RUN useradd -m -u 1000 user
USER user
ENV PATH="/home/user/.local/bin:${PATH}"

WORKDIR /home/user/app

# Copy requirements and install
COPY --chown=user requirements.txt .
RUN pip install --no-cache-dir --upgrade -r requirements.txt

# Copy the rest of the application
COPY --chown=user . .

# Expose the port Voila will run on
EXPOSE 7860

# Command to run the application using Voila
# We use --port 7860 as it's the default for Hugging Face Spaces
CMD ["voila", "Manmeet_ Task.py", "--port", "7860", "--no-browser", "--Voila.ip", "0.0.0.0"]
