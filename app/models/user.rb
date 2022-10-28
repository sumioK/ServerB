class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true ,uniqueness: true, format: {with: /@/,message:"不正なメールアドレスです"}
  validates :password, presence:true
  has_many :users, dependent: :destroy
end
