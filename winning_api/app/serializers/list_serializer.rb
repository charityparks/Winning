class ListSerializer < ActiveModel::Serializer
    attributes :title, :description, :items
  
     has_many :items
  end