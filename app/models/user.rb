class User < ApplicationRecord
    has_secure_password

    has_many :houses
    has_many :comments
    has_many :rooms, through: :houses

    validates :username, presence: true
    validates_uniqueness_of :username
end