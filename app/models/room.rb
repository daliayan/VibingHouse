class Room < ApplicationRecord
    has_many :house_rooms
    has_many :houses, through: :house_rooms
    has_many :users, through: :houses  

    validates :name, presence: true

end