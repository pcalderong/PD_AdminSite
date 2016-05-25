module PersonasHelper
  def get_estados_civiles()
      Lookup.where(lookup_type: 'EstadoCivil').collect { |m| [m.value, m.id] }
  end

  def field_class(resource, field_name)
    if resource.errors[field_name]
      return "error".html_safe
    else
      return "form-control".html_safe
    end
  end
end
