json.array!(@info_contactos) do |info_contacto|
  json.extract! info_contacto, :id, :telefono, :nombre_contacto, :parentesco, :fk_id_paciente
  json.url info_contacto_url(info_contacto, format: :json)
end
