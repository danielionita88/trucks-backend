class Post < ApplicationRecord
    has_many :likes
    belongs_to :user

    has_many_attached :photos
    # scope :with_wager_loaded_photos, -> { eager_load(images_attachments: :blob) }
end
