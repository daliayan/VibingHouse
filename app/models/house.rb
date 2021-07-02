class House < ApplicationRecord
    belongs_to :user
    has_many :house_rooms
    has_many :rooms, through: :house_rooms

    validates :price, :hex, :size, presence: true
    validates :name, presence: true, uniqueness: true

    scope :most_expensive_house, -> {where("price >= 999999999")}


    def self.most_expensive_house
        order(price: :desc)
    end

end