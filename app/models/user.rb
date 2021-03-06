class User < ApplicationRecord
    has_secure_password
    has_many :houses
    has_many :rooms, through: :houses

    validates :username, presence: true
    validates_uniqueness_of :username

    def self.from_omniauth(response)
        User.find_or_create_by(uid: response[:uid], provider: response[:provider]) do |u|
            u.username = response[:info][:name]
            u.password = SecureRandom.hex(15)
        end
    end
end