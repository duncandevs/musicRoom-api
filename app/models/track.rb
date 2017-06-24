class Track < ApplicationRecord
  has_many :votes
  belongs_to :album
  belongs_to :event
end
