class ItemSerializer < ActiveModel::Serializer
  attributes :list_id, :name, :items, :id

  belongs_to :list
end
