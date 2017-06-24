class AlbumSerializer < ActiveModel::Serializer
  attributes :name, :uri, :image
  has_many :tracks
end
