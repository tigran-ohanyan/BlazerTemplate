#!/bin/bash
set -e

# Выполняем миграции при запуске контейнера
dotnet ef database update --no-build

# Запускаем приложение
exec dotnet BlazorApp.dll
