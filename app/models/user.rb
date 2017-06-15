class User < ApplicationRecord
  has_secure_password
  has_many :rooms
  has_many :attendances
  has_many :events , through: :attendances
  has_many :playlists

  validates :name, presence: true
  validates :username, presence: true , uniqueness: true
  validates :password, presence: true
end
