class User < ApplicationRecord
    has_many :posts, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :liked_posts, through: :likes, source: :post
    has_secure_password
    validates :username, uniqueness: {case_sensitive: false}, length: {minimum:3}
    validates :email, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}, uniqueness: true
  
end
