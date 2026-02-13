FROM python:3.11-slim

WORKDIR /app

# Установка зависимостей
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Копирование кода
COPY . .

# Создание папок для данных
RUN mkdir -p /app/data /app/logs

# Запуск бота
CMD ["python", "bot.py"]
