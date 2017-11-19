class User < ApplicationRecord
  enum level: [:regular, :admin]

  has_secure_password
end