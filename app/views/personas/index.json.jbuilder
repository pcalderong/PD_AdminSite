json.array!(@personas) do |persona|
  json.extract! persona, :id, :nombre, :primer_apellido, :segundo_apellido, :fecha_nacimiento, :correo_electronico, :genero, :cedula, :estado_civil, :telefono
  json.url persona_url(persona, format: :json)
end
