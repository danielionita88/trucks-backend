class Post < ApplicationRecord
    has_many :likes
    belongs_to :user

    has_one_attached :photo
end
