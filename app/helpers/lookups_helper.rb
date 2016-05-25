module LookupsHelper

  def get_type_id(value)
    return Lookup.where(lookup_type: get_type_value(value)).first.parent
  end

  def get_type_value(value)
    case value
    when "Direcciones"
        return "Direccion"
      when "Estados Paciente"
        return "EstadoPaciente"
      when "Especialidades"
        return "Especialidad"
      when "Padecimientos"
        return "Padecimiento"
      when "Hospitales"
        return "Hospital"
      when "Tipo de Atencion"
        return "TipoAtencion"
      when "Estado Civil"
        return "EstadoCivil"
      end
    end
end
