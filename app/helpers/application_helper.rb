module ApplicationHelper
  def data_for_select(param)
    Lookup.where(lookup_type: param).collect { |m| [m.value, m.id] }
  end

  def id_to_value_direccion(id)
    return Lookup.where(id: id).first.value
  end

  def direccion_for_select(value)
    puts "test"
    Lookup.where(lookup_type: "Direccion", descripcion: value).collect { |m| [m.value, m.id] }
  end
end
