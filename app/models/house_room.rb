class HouseRoom < ApplicationRecord
    belongs_to :house
    belongs_to :room

    # validates :content, presence: true, length: {minimum: 5, maximum: 500 }

end