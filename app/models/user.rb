class User < ApplicationRecord
  enum level: [:regular, :admin]

  has_secure_password

  validates :email, :presence => true, uniqueness: true
  validates :password_digest, :presence => true
  validates :level, :presence => true
end