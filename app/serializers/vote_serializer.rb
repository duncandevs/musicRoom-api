class VoteSerializer < ActiveModel::Serializer
  attributes :id, :track_id, :user_id, :vote
  belongs_to :track
  belongs_to :user
end
