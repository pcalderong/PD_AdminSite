json.array!(@info_extra_pacientes) do |info_extra_paciente|
  json.extract! info_extra_paciente, :id, :estudiante, :trabajador, :lugar_estudio_trabajo, :hijos, :cant_hijos, :referencia_trab_social, :ayuda_alimentos, :ayuda_medicamento, :fk_id_persona
  json.url info_extra_paciente_url(info_extra_paciente, format: :json)
end
