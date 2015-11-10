json.array!(@variables) do |variable|
  json.extract! variable, :id, :name, :sparql
end
