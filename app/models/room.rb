class Room < ApplicationRecord
    belongs_to :house
    belongs_to :user, through: :houses  

    validates :name, :room_description, :windows, :hex, presence: true
    validate :too_many_rooms


    def too_many_rooms
        my_house = self.user.rooms
        if my_house.size > 10
            errors.add(:room_id, "There are too many rooms.")
        end
    end

end