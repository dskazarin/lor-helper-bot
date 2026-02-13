@echo off
echo 🚀 Установка ЛОР-Помощника
echo ==========================

:: Проверка Python
python --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Python не установлен!
    echo Установите Python 3.8 или выше: https://python.org
    pause
    exit /b 1
)

:: Создание виртуального окружения
echo 📦 Создание виртуального окружения...
python -m venv venv

:: Установка зависимостей
echo 📚 Установка зависимостей...
call venv\Scripts\activate
pip install --upgrade pip
pip install -r requirements.txt

:: Создание папок
echo 📁 Создание папок для данных...
if not exist data mkdir data
if not exist logs mkdir logs

:: Настройка токена
echo.
echo 🔑 Получите токен бота у @BotFather в Telegram
set /p token="Введите токен бота: "

:: Сохранение токена
echo BOT_TOKEN=%token% > .env
echo DEBUG=False >> .env

echo.
echo ✅ Установка завершена!
echo.
echo Для запуска выполните:
echo   venv\Scripts\activate
echo   python bot.py
echo.
pause
