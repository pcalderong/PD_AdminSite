module DireccionsHelper
  def provincia_for_select()
    Lookup.where(lookup_type: "Direccion", descripcion: "Provincia").collect { |m| [m.value, m.id] }
  end

  def canton_for_select(provincia)
    Lookup.where(lookup_type: "Direccion", descripcion: "Canton - #{provincia}").collect { |m| [m.value, m.id] }
  end

  def distrito_for_select(canton)
    Lookup.where(lookup_type: "Direccion", descripcion: "Distrito - #{canton}").collect { |m| [m.value, m.id] }
  end

  def id_to_value_direccion(id)
    return Lookup.where(id: id).first.value
  end
end


# @provincias = Direccion.find_by(description: 'Provincia')
# @cantones = Direccion.find_by(description: "Canton - #{@provincias.first.value}")
