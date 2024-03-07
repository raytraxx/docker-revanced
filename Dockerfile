FROM python:3.12-slim-bookworm

RUN apt-get -qq update && \
    apt-get -qq -y --no-install-recommends install openjdk-17-jre && \
    apt-get -qq -y upgrade

# Copy and install Python dependencies
COPY requirements.txt .
RUN python -m pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

RUN mkdir /output
COPY keystore/revanced.keystore /revanced.keystore

# Copy application code
COPY . ${APP_HOME}

# Set the default command to run the entrypoint script
CMD ["python","main.py"]
