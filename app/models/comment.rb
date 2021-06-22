class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :house

    validates :content, presence: true
    validates :house, uniqueness: {scope: :user_id, message: "Only one comment per user allowed. Thank you."}
end