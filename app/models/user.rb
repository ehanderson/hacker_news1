class User < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_secure_password
  validates_uniqueness_of :name
end
