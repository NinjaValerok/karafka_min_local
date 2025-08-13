# README

минимальный проект для локального запуска кафки в докере  

## инструкция
```
запуск кафки (либо можно с флагом -d, но тогда нужно отдельно подключаться к логам)
docker compose up

запустить bash в контейнере сервиса karafka (либо через run либо через exec)
docker-compose run --rm karafka bash

запуск консоли
bundle exec irb -r ./karafka.rb

отправка сообщения
Karafka.producer.produce_sync(topic: 'example', payload: { 'ping' => 'pong' }.to_json)
```