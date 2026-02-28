# -----------------------------
# Base image with Python 3
# -----------------------------
FROM python:3.12-slim

# -----------------------------
# Environment variables
# -----------------------------
ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    ROBOT_HOME=/opt/robotframework \
    DISPLAY=:99 \
    PIP_NO_CACHE_DIR=1 \
    DEBIAN_FRONTEND=noninteractive

# -----------------------------
# Set working directory
# -----------------------------
WORKDIR $ROBOT_HOME

# -----------------------------
# Install system dependencies
# -----------------------------
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        wget \
        curl \
        unzip \
        gnupg \
        xvfb \
        lsb-release \
        sudo \
        ca-certificates \
        git \
        firefox-esr \
        gnupg2 \
        apt-transport-https \
    && rm -rf /var/lib/apt/lists/*

# -----------------------------
# Install Google Chrome + ChromeDriver
# -----------------------------
RUN curl -fsSL https://dl.google.com/linux/linux_signing_key.pub | gpg --dearmor -o /usr/share/keyrings/google-linux-signing-key.gpg && \
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/google-linux-signing-key.gpg] http://dl.google.com/linux/chrome/deb/ stable main" \
        > /etc/apt/sources.list.d/google-chrome.list && \
    apt-get update && \
    apt-get install -y google-chrome-stable && \
    rm -rf /var/lib/apt/lists/*

RUN CHROME_VERSION=$(google-chrome --version | awk '{print $3}' | cut -d '.' -f1) && \
    LATEST_DRIVER=$(curl -s https://chromedriver.storage.googleapis.com/LATEST_RELEASE_$CHROME_VERSION) && \
    wget -O /tmp/chromedriver.zip https://chromedriver.storage.googleapis.com/$LATEST_DRIVER/chromedriver_linux64.zip && \
    unzip /tmp/chromedriver.zip -d /usr/local/bin/ && \
    rm /tmp/chromedriver.zip && \
    chmod +x /usr/local/bin/chromedriver

# -----------------------------
# Install Microsoft Edge + EdgeDriver
# -----------------------------
RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg && \
    install -o root -g root -m 644 microsoft.gpg /usr/share/keyrings/ && \
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft.gpg] https://packages.microsoft.com/repos/edge stable main" \
        > /etc/apt/sources.list.d/microsoft-edge.list && \
    apt-get update && \
    apt-get install -y microsoft-edge-stable && \
    rm -rf /var/lib/apt/lists/*

RUN EDGE_VERSION=$(microsoft-edge --version | awk '{print $3}' | cut -d '.' -f1) && \
    LATEST_EDGE_DRIVER=$(curl -s https://msedgedriver.azureedge.net/LATEST_RELEASE_$EDGE_VERSION) && \
    wget -O /tmp/edgedriver.zip https://msedgedriver.azureedge.net/$LATEST_EDGE_DRIVER/edgedriver_linux64.zip && \
    unzip /tmp/edgedriver.zip -d /usr/local/bin/ && \
    rm /tmp/edgedriver.zip && \
    chmod +x /usr/local/bin/msedgedriver

# -----------------------------
# Install Python dependencies
# -----------------------------
COPY requirements.txt .
RUN pip install --upgrade pip && \
    pip install -r requirements.txt

# -----------------------------
# Copy Robot Framework project
# -----------------------------
COPY TestEntropy $ROBOT_HOME

# -----------------------------
# Expose VNC port (optional, for debugging)
# -----------------------------
EXPOSE 5900

# -----------------------------
# Default command: start Xvfb then run Robot tests
# -----------------------------
CMD ["sh", "-c", "Xvfb :99 -screen 0 1920x1080x24 & robot --variable BROWSER:${BROWSER} --outputdir reports TestEntropy/Tests/"]