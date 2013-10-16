class User < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :post_votes
  has_many :comment_votes
  has_secure_password
  validates_uniqueness_of :name
end
