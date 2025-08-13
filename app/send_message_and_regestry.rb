require 'avro_turf/messaging'
require 'avro_turf'

avro = AvroTurf::Messaging.new(registry_url: "http://schema-registry:8081/", schemas_path: "/app/schemas/")

data = { full_name:  "Jane Doe2222333", "age" => '28222', "properties" => {
  "city" => "Moscow",
  "job" => "Engineer"
} }

# если до регистрации схемы, вызвать с параметром version
# то будет ошибка, тк схема будет грузиться из регестри
# /usr/local/bundle/gems/avro_turf-1.18.0/lib/avro_turf/messaging.rb:164:in `rescue in encode': Schema with subject: `greeting2` version: `1` is not found on registry (AvroTurf::SchemaNotFoundError)
data = avro.encode({ "title" => "hello, world" }, subject: "greeting2", version: 1)

# если version: 1 нет, то при первом обращении схема будет зарегистрирована
# в логах компоуза можно будет найти лог
# schema-registry-1  | [2025-08-13 11:45:51,573] INFO 172.20.0.5 - - [13/Aug/2025:11:45:51 +0000] "POST /subjects/person/versions HTTP/1.1" 200 8 "-" "excon/0.112.0" 260 (io.confluent.rest-utils.requests)
encoded_message = avro.encode(data, schema_name: "person", validate: true)
puts encoded_message
