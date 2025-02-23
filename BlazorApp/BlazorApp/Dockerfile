# Используем базовый образ с ASP.NET
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
EXPOSE 8080

# Используем SDK для сборки проекта
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
ARG BUILD_CONFIGURATION=Release
WORKDIR /src

# Копируем файлы проекта и восстанавливаем зависимости
COPY BlazorApp/ BlazorApp/
WORKDIR "/src/BlazorApp"
RUN dotnet restore "BlazorApp.csproj"

# Собираем проект
RUN dotnet build "BlazorApp.csproj" -c $BUILD_CONFIGURATION -o /app/build

# Публикуем проект с учетом статических файлов и отключением тримминга
FROM build AS publish
RUN dotnet publish "BlazorApp.csproj" -c $BUILD_CONFIGURATION -o /app/publish \
    --no-restore --property:StaticWebAssets=true --property:PublishTrimmed=false

# Финальный образ без SDK
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS final
WORKDIR /app

# Копируем опубликованные файлы
COPY --from=publish /app/publish .

# Запуск приложения
ENTRYPOINT ["dotnet", "BlazorApp.dll"]
