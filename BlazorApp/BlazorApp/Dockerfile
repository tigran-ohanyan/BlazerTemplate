# Используем базовый образ с ASP.NET
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
EXPOSE 8080

# Используем SDK для сборки проекта
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
ARG BUILD_CONFIGURATION=Release
WORKDIR /src

# Копируем файл проекта и восстанавливаем зависимости
COPY ["BlazorApp/BlazorApp.csproj", "BlazorApp/"]
RUN dotnet restore "BlazorApp/BlazorApp.csproj"

# Копируем все остальные файлы и собираем проект
COPY BlazorApp/. ./BlazorApp/
WORKDIR "/src/BlazorApp"
RUN dotnet build "BlazorApp.csproj" -c $BUILD_CONFIGURATION -o /app/build

# Публикуем проект
FROM build AS publish
RUN dotnet publish "BlazorApp.csproj" -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false

# Финальный образ, где запускаем приложение
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS final
WORKDIR /app

# Устанавливаем необходимые пакеты
RUN apt-get update && apt-get install -y \
    wget \
    curl \
    gnupg \
    apt-transport-https \
    ca-certificates

# Добавляем репозиторий Microsoft и ключ
RUN wget https://packages.microsoft.com/config/debian/11/prod.list -O /etc/apt/sources.list.d/microsoft-prod.list \
    && curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | tee /etc/apt/trusted.gpg.d/microsoft.asc > /dev/null \
    && apt-get update

# Устанавливаем .NET SDK и dotnet-ef
RUN apt-get install -y dotnet-sdk-8.0 && dotnet tool install --global dotnet-ef

# Обновляем PATH
ENV PATH="${PATH}:/root/.dotnet/tools"

# Копируем опубликованные файлы
COPY --from=publish /app/publish .

