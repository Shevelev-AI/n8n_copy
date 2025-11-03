FROM n8nio/n8n:latest

# Устанавливаем зависимости для Chrome
USER root
RUN apt-get update && apt-get install -y \
    wget \
    ca-certificates \
    fonts-liberation \
    libasound2 \
    libatk-bridge2.0-0 \
    libatk1.0-0 \
    libcups2 \
    libdbus-1-3 \
    libdrm2 \
    libgbm1 \
    libgtk-3-0 \
    libnspr4 \
    libnss3 \
    libxcomposite1 \
    libxdamage1 \
    libxfixes3 \
    libxrandr2 \
    libxkbcommon0 \
    libxshmfence1 \
    xdg-utils \
    && rm -rf /var/lib/apt/lists/*

# Устанавливаем Puppeteer
RUN npm install puppeteer

# Возвращаемся к пользователю n8n
USER node
