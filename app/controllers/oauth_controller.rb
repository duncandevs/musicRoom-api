class OauthController < ApplicationController
  def index
    render json: "welcome home pete"
  end
  def refresh
    # event_id = Event.find_by(params[:event_id]).host_id
    # user_id = User.find_by(event_id:event_id).id
    oldToken = "BQCY0ruJTIinv5Cx60twRUELplyEWsOxpNc2On5fmawxLijTrYek3OlqXSjGO_DhgXNjbUBYgDZfxv6Yq8HnShb1Hcg2kvxSMJDhyq72IyYmlYj1xcRPZqzSGgD5-oBulVUSyupYqwOeiEzWl7LA7bTkCEMtTkeq7g9jN70MshgFTnDziCjIptsXUnxCTxtIQDmhDPP7MqftPQQgkK7UkPvgCiFkJH5JvI9y4XRVJlcJoQHiHwyFEkDaiuzWc5MAlLyY2wfYmOcCEqaKdfiX2WsPQ9iE"
    key = Base64.encode64('d2a6a11d756a4c4da594170cd80f425e:4fe90b825c294147be96f6181e4cc8bb')
    res = HTTParty.post('https://accounts.spotify.com/api/token',{
        body:{
          grant_type: "refresh_token",
          refresh_token: oldToken,
        },
        headers:{
          Authorization: "Basic " + key
        }
    })
    render json: res
  end

  def spotify
    user_id = params[:id]
    code = params[:code]
    redirect_uri = 'http://localhost:3000/spotify'
    client_id = 'd2a6a11d756a4c4da594170cd80f425e'
    client_secret = '4fe90b825c294147be96f6181e4cc8bb'
    res = HTTParty.post('https://accounts.spotify.com/api/token',{
      body: {
        grant_type: 'authorization_code',
        code: code,
        redirect_uri: redirect_uri,
        client_id: client_id,
        client_secret: client_secret
      }
    })
    redirect_to("http://localhost:3001/token/#{res.parsed_response["access_token"]}")
  end
  #check commit diff

  def create_token
    if !Oauth.find_by(user_id: params[:id])
      token = Oauth.create(user_id: params[:id], token: params[:token])
      render json: token
    else
      update_token
    end
  end

  def update_token
    oauth = Oauth.find_by(user_id: params[:id])
    oauth.update(token: params[:token])
  end

  def get_token
    render json: Oauth.find_by(user_id: params[:id])
  end

  private

  def find_room_by_code
    Room.find_by(code:params[:code])
  end
end
