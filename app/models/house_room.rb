class HouseRoom < ApplicationRecord
    belongs_to :house
    belongs_to :room

    validates :windows, :hex, presence: true
end