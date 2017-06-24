class TrackSerializer < ActiveModel::Serializer
  attributes :id, :name, :artist, :cover, :uri, :status, :voteCount
  belongs_to :album
  has_many :votes

  def voteCount
    object.votes.count
  end
end
