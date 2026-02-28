# syntax=docker/dockerfile:1

ARG PYTHON_VERSION=3.10.12
FROM python:${PYTHON_VERSION}-slim

ENV PATH="/usr/local/bin:${PATH}"
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

# Install system dependencies + Chrome
RUN apt-get update && apt-get install -y \
    wget curl unzip xvfb x11-utils gnupg fonts-liberation \
    libnss3 libx11-xcb1 libxcomposite1 libxcursor1 libxdamage1 libxi6 \
    libxtst6 libxrandr2 libxrender1 libglib2.0-0 libgtk-3-0 libdbus-glib-1-2 \
    libasound2 libgbm1 libvulkan1 xdg-utils \
    && wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
    && apt install -y ./google-chrome-stable_current_amd64.deb \
    && rm google-chrome-stable_current_amd64.deb \
    && rm -rf /var/lib/apt/lists/*

# Create non-root user
ARG UID=10001
RUN adduser \
    --disabled-password \
    --gecos "" \
    --home "/home/appuser" \
    --shell "/bin/bash" \
    --uid "${UID}" \
    appuser

# Create writable folders
RUN mkdir -p /app/reports /app/.selenium_cache \
    && chown -R appuser:appuser /app

ENV SELENIUM_CACHE_DIR=/app/.selenium_cache

# Install Python dependencies as root
COPY requirements.txt .
RUN python -m pip install --upgrade pip \
    && python -m pip install --no-cache-dir -r requirements.txt

# Switch to non-root user
USER appuser

# Copy project
COPY . .

EXPOSE 8000

CMD xvfb-run --server-args="-screen 0 1920x1080x24" \
    robot --variable BROWSER:${BROWSER} --outputdir reports TestEntropy/Tests/