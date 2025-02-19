#!/bin/bash

# Путь к проекту
PROJECT_PATH="/app/BlazorApp/BlazorApp.csproj"

# Выполнение миграций EF, если это необходимо
dotnet ef database update --project $PROJECT_PATH --startup-project $PROJECT_PATH

# Запуск приложения
dotnet BlazorApp.dll
