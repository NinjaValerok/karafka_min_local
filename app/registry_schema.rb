require 'avro_turf/messaging'
require 'avro_turf'

schema = '{
  "type": "record",
  "name": "greeting",
  "namespace": "com.example",
  "fields": [
    {
      "name": "title",
      "type": "string"
    }
  ]
}'


registry = AvroTurf::ConfluentSchemaRegistry.new("http://schema-registry:8081/")
registry.register('greeting', schema)
data = avro.encode({ "title" => "hello, world" }, subject: 'greeting', version: 1)
puts data