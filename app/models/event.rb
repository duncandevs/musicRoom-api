class Event < ApplicationRecord
  belongs_to :host, class_name: "User"
  has_many :attendances
  has_many :users, through: :attendances
  has_many :playlists

  def self.generate_code
    code = SecureRandom.hex(3)
    if (Event.find_by(invite_code: code))
      self.generate_code
    else
      code
    end
  end
end
