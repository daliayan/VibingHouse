class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :house

    validates :content, presence: true, length: {minimum: 5, maximum: 500 }
    validates :house, uniqueness: {scope: :user_id, message: "Only one comment per user."}
end