# Используем базовый образ .NET для ASP.NET приложения
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
EXPOSE 8080

# Используем SDK для сборки проекта
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
ARG BUILD_CONFIGURATION=Release
WORKDIR /src

# Копируем файл проекта в контейнер
COPY ["BlazorApp/BlazorApp.csproj", "BlazorApp/"]

# Восстанавливаем зависимости
RUN dotnet restore "BlazorApp/BlazorApp.csproj"

# Копируем все остальные файлы проекта
COPY BlazorApp/. ./BlazorApp/

WORKDIR "/src/BlazorApp"

# Собираем проект
RUN dotnet build "BlazorApp.csproj" -c $BUILD_CONFIGURATION -o /app/build

# Публикуем проект
FROM build AS publish
ARG BUILD_CONFIGURATION=Release
RUN dotnet publish "BlazorApp.csproj" -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false

# Устанавливаем SDK и инструмент dotnet-ef
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS final
WORKDIR /app

# Устанавливаем необходимые пакеты для добавления репозитория
RUN apt-get update && apt-get install -y \
    wget \
    curl \
    gnupg \
    apt-transport-https \
    ca-certificates

# Добавляем репозиторий Microsoft для .NET SDK
RUN wget https://packages.microsoft.com/config/debian/11/prod.list -O /etc/apt/sources.list.d/microsoft-prod.list \
    && curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
    && apt-get update

# Устанавливаем .NET SDK
RUN apt-get install -y dotnet-sdk-8.0

# Устанавливаем инструмент dotnet-ef
RUN dotnet tool install --global dotnet-ef

# Обновляем переменную окружения PATH
ENV PATH="${PATH}:/root/.dotnet/tools"

# Копируем опубликованные файлы
COPY --from=publish /app/publish .

# Делаем скрипт исполнимым
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Настройка Entrypoint
ENTRYPOINT ["/entrypoint.sh"]
