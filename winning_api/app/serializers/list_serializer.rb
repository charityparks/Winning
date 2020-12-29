class ListSerializer < ActiveModel::Serializer
    attributes :id, :title, :description, :items
  
     has_many :items
  end