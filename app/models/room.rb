class Room < ApplicationRecord
    has_many :house_rooms
    has_many :houses, through: :house_rooms
    has_many :users, through: :houses  

    validates :name, presence: true
    validates :description, presence: true
    # validate :too_many_rooms


    # def too_many_rooms
    #     my_house = self.user.rooms
    #     if my_house.size > 10
    #         errors.add(:room_id, "There are too many rooms.")
    #     end
    # end

end