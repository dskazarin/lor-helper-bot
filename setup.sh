#!/bin/bash

echo "🚀 Установка ЛОР-Помощника"
echo "=========================="

# Проверка Python
if ! command -v python3 &> /dev/null; then
    echo "❌ Python3 не установлен!"
    echo "Установите Python 3.8 или выше: https://python.org"
    exit 1
fi

# Создание виртуального окружения
echo "📦 Создание виртуального окружения..."
python3 -m venv venv

# Активация и установка зависимостей
echo "📚 Установка зависимостей..."
source venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt

# Создание папок
echo "📁 Создание папок для данных..."
mkdir -p data logs

# Настройка токена
echo ""
echo "🔑 Получите токен бота у @BotFather в Telegram"
read -p "Введите токен бота: " token

# Сохранение токена
echo "BOT_TOKEN=$token" > .env
echo "DEBUG=False" >> .env

echo ""
echo "✅ Установка завершена!"
echo ""
echo "Для запуска выполните:"
echo "  source venv/bin/activate"
echo "  python bot.py"
echo ""
echo "Или используйте Docker:"
echo "  docker-compose up -d"
