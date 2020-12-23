class Item < ApplicationRecord
    belongs_to :list, optional: true
    validates :name, presence: true
end
