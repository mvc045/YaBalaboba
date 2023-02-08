<img src="https://user-images.githubusercontent.com/75852774/217527668-065f1591-636f-44f6-ba8e-0208847c8783.jpg" height="180">

Балабоба демонстрирует, как с помощью нейросетей семейства YaLM можно продолжать тексты на любую тему, сохраняя связность и заданный стиль. Здесь YaLM используется для развлечения, но разрабатывались модели для серьёзных задач — например, Поиска или Алисы. Подробнее об этом можно почитать [тут](https://yandex.ru/lab/yalm-howto)

У Балабобы нет своего мнения или знания. Он умеет только подражать — писать тексты так, чтобы они были максимально похожи на реальные тексты из интернета.


## Установка

**Swift Package Manager**

Чтобы интегрировать YaBalaboba в ваш проект используя Package.swift нужно указать зависимость:

```
dependencies: [
	.package(url: "https://github.com/mvc045/YaBalaboba", .branch("master"))
]
```

**Через Xcode**

File -> Add packages -> ```https://github.com/mvc045/YaBalaboba```

## Пример использования

```
/// Получить варианты стилизации
balaboba.getGenreList() { data, error in

}

/// Сгенерировать текст
/// query - запрос
/// genreId - id стилизации
balaboba.getText(query: "Hello World", genreId: 0) { data, error in

}

// Получить историю
balaboba.getResponseList()
```

[Пример приложения](https://github.com/mvc045/YaBalabobaExample)
