json.array!(@diagnosticos) do |diagnostico|
  json.extract! diagnostico, :id, :fecha, :description, :fk_id_persona
  json.url diagnostico_url(diagnostico, format: :json)
end
