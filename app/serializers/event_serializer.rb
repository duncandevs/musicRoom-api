class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :invite_code , :eventHost
  has_one :playlists


  def eventHost
    {name: object.host.name, username: object.host.username, id:object.host.id}
  end
end
