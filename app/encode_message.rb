# простая сериализация, схема описана в файле, нету обращения в регестри

require 'avro_turf'
avro = AvroTurf.new(schemas_path: "/app/schemas/")

data = { full_name:  "Jane Doe2222333", "age" => '28222', "properties" => {
  "city" => "Moscow",
  "job" => "Engineer"
} }
encoded_message = avro.encode(data, schema_name: "person", validate: true)
puts encoded_message