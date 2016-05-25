json.array!(@historial_clinicos) do |historial_clinico|
  json.extract! historial_clinico, :id, :fk_id_persona, :fecha, :fk_id_lookup, :orden
  json.url historial_clinico_url(historial_clinico, format: :json)
end
