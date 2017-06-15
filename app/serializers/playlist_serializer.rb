class PlaylistSerializer < ActiveModel::Serializer
  attributes :id , :spotifyId, :event_id, :user_id, :embed_uri
  belongs_to :event
  belongs_to :user
end
