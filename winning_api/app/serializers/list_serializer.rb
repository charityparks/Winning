class ListSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :description, :items
end
