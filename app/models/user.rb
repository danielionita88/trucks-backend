class User < ApplicationRecord
    has_many :posts, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :liked_posts, through: :likes, source: :post
    has_secure_password
    validates :username, uniqueness: {case_sensitive: false}
  
end
