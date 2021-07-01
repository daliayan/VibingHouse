class House < ApplicationRecord
    belongs_to :user
    has_many :house_rooms
    has_many :rooms, through: :house_rooms
    has_many :comments
    has_many :users, through: :comments

    validates :price, :hex, :size, presence: true
    validates :name, presence: true, uniqueness: true

    validates :most_expensive_house


    def self.most_expensive_house
        where("price >= 999999999")
    end

end