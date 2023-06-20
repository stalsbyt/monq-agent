# Monq Agent Helm Chart

* Устанавливает Monq agent ([monq.ru](https://monq.ru)) в кластер Kubernetes

## Установка Monq agent через Helm

Должен быть установлен [Helm](https://helm.sh) для использования чартов.

Пожалуйста, обратитесь к [документации](https://helm.sh/docs/) по Helm, чтобы начать.

Когда Helm будет настроен правильно, установите последнюю версию чарта с именем релиза `monq-agent` следующей командой:

```console
kubectl create namespace monq

helm repo add monq-agent https://stalsbyt.github.io/monq-agent

helm install monq-agent -n monq oci://acureio.azurecr.io/charts/monq-agent \
--set config.baseUri="https://monq.mydomain.com" --set config.apiKey="<my coordinator key>"
```

## Удаление Monq agent через Helm

Для удаления `monq-agent` выполните следующую команду:

```console
helm delete monq-agent -n monq
```

Данная команда удаляет все компоненты Kubernetes, связанные с чартом, и удаляет релиз.

## Конфигурация

| Ключ                        | Тип    | Значение по умолчанию          | Описание                                                                                                                                                                                                   |
|:----------------------------|:-------|:-------------------------------|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `config.baseUri`            | string | `nil`                          | Полностью определенное доменное имя (FQDN) экземпляра Monq                                                                                                                                                 |
| `config.apiKey`             | string | `nil`                          | API ключ координатора Monq                                                                                                                                                                                 |
| `config.fileStorage`        | string | `nil`                          | Путь к хранилищу файлов агента                                                                                                                                                                             |
| `config.timeout`            | int    | `100`                          | Таймаут для подключения к экземпляру Monq                                                                                                                                                                  |
| `config.pluginsPath`        | string | `agent-plugins`                | Путь к хранилищу плагинов агента                                                                                                                                                                           |
| `config.retryCount`         | int    | `10`                           | Количество попыток повторного подключения к экземпляру Monq                                                                                                                                                |
| `config.slotsCount`         | int    | `2`                            | Количество активных слотов агента                                                                                                                                                                          |
| `replicas`                  | int    | `1`                            | Количество реплик агента                                                                                                                                                                                   |
| `image.repository`          | string | `ghcr.io/stalsbyt`             | Репозиторий образов контейнеров                                                                                                                                                                            |
| `image.name`                | string | `monq-agent`                   | Название образа                                                                                                                                                                                            |
| `image.pullPolicy`          | string | `IfNotPresent`                 | Политика загрузки образа                                                                                                                                                                                   |
| `image.tag`                 | string | `nil`                          | Тэг образа, используется `AppVersion`, если не определено                                                                                                                                                  |
| `imagePullSecrets`          | list   | `[]`                           | Необязательный массив imagePullSecrets, содержащий учетные данные для доступа к закрытому реестру образов # Справка: https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/ |
| `resources.limits.cpu`      | string | `nil`                          | Лимит использования ЦПУ                                                                                                                                                                                    |
| `resources.limits.memory`   | string | `nil`                          | Лимит использования памяти                                                                                                                                                                                 |
| `resources.requests.cpu`    | string | `100m`                         | Запрашиваемые ресурсы ЦПУ                                                                                                                                                                                  |
| `resources.requests.memory` | string | `128Mi`                        | Запрашиваемые ресурсы памяти                                                                                                                                                                               |
| `nodeSelector `             | object | `{"kubernetes.io/os":"linux"}` | Метки `nodeSelector` для распределения пода на ноде # Справка: https://kubernetes.io/docs/user-guide/node-selection/ #                                                                                     |