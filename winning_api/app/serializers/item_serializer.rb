class ItemSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :id
end
