class User < ApplicationRecord
    has_secure_password

    has_many :houses
    has_many :comments
    has_many :rooms, through: :houses

    validates :username, presence: true, uniqueness: true
end