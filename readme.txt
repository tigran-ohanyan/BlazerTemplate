Запуск очень простой просто в корневом папке проекта где находится docker-compose.yml файл открываем командную строку
Пишем: docker-compose up --build
Ждем...

В проекте реализованы несколько компонентов для Blazor
Так и присутсвует хард код который не стоит повторить)

Все страницы имеют доступы: на пример для того чтобы посмотреть список пользователей нужно иметь роль 2(Админ)
Для удобство есть пользователь который при старте проекта появляется )
email: admin@admin.com 
password: 123456



Могут быть проблемы с миграцей ДБ просто перезапустите докер компоусе

хэширование паролей и валидацию инпутов не добавлял (знаю что это такое но по моему нет смысла в тестовом проекте использовать)

