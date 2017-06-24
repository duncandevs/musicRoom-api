class Event < ApplicationRecord
  belongs_to :host, class_name: "User"
  has_many :playlists
  has_many :chatmsgs
  has_many :tracks

  def self.generate_code
    code = SecureRandom.hex(3)
    if (Event.find_by(invite_code: code))
      self.generate_code
    else
      code
    end
  end
end
