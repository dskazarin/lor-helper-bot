#!/bin/bash

# Загрузка переменных из .env
if [ -f .env ]; then
    export $(cat .env | grep -v '^#' | xargs)
fi

# Активация виртуального окружения
source venv/bin/activate

# Запуск бота
python bot.py
