class Post < ApplicationRecord
    has_many :likes
    belongs_to :user

    has_many_attached :photos
    
end
