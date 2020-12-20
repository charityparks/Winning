class ItemSerializer < ActiveModel::Serializer
  attributes :list_id, :name, :items

  belongs_to :list
end
