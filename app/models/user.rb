class User < ApplicationRecord
  has_many :users, dependent: :destroy
end
