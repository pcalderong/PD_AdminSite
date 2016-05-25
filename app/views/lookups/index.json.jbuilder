json.array!(@lookups) do |lookup|
  json.extract! lookup, :id, :parent, :value, :descripcion, :lookup_type
  json.url lookup_url(lookup, format: :json)
end
