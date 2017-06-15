class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :invite_code
  has_one :playlists
end
