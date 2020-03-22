# VK-Handshakes(NetStalking)
Клиент-серверное приложение для Нет-сталкинга ВК, с оновной фичей - построение цепочек рукопожатий между пользователями

## Autors 
- Pavlov Max
- Julikov Yaroslav

# Server

## Server response without params
- IP:8088

## List of availible API methods

- `/?method=handshake&users=id100,id200`
- `...`

## Result Codes
- `0` - Success with nothing (API is alive)
- `1` - Success

- `-1` - Can not resolve request with this paramters
- `-2` - ...
- `-3` - ...

## Future Features

- Выбрать минимальную глубину цепочки
- Смежные друзья для n-ного количества пользователей
- Смежные лайки на нескольких постах
- Вычисление возраста по друзьям
- Вычисление города по друзьям
- Вычисление инстаграма
- Дата создания страницы

## Response Example
```
{
"resultCode": "1",
"resultDescription": "Success",
"result": "..."
}
```

# Front IOS-App

...