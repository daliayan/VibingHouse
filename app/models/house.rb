class House < ApplicationRecord
    belongs_to :user
    has_many :house_rooms
    has_many :rooms, through: :house_rooms
    has_many :comments
    has_many :users, through: :comments

    validates :price, :hex, :size, presence: true
    validates :name, presence: true, uniqueness: true

    validate :most_expensive_house


    def self.most_expensive_house
        order(price: :desc)
    end

end