json.array!(@direccions) do |direccion|
  json.extract! direccion, :id, :fk_id_persona, :provincia, :canton, :distrito, :direccion_exacta
  json.url direccion_url(direccion, format: :json)
end
