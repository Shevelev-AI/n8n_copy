# Берём официальный образ n8n
FROM n8nio/n8n:latest

# Ставим нужные пакеты для Chrome/Puppeteer
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
    --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

# Ставим Puppeteer
RUN npm install puppeteer --omit=dev

# Возвращаемся к пользователю n8n
USER node

# Если нужно, открываем порт 5678 (по умолчанию n8n)
EXPOSE 5678
