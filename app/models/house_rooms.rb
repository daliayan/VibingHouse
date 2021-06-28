class HouseRooms < ApplicationRecord
    belongs_to :user
    belongs_to :room, through: :house

    validates :content, presence: true, length: {minimum: 5, maximum: 500 }

end