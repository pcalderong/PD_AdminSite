module DiagnosticosHelper
  def data_for_select(param)
    Lookup.where(lookup_type: param).collect { |m| [m.value, m.id] }
  end

  def id_to_value_diagnostico(id)
    return Lookup.where(id: id).first.value
  end
end
