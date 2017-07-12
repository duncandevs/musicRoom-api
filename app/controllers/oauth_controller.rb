class OauthController < ApplicationController
  def index
    render json: "welcome home pete"
  end
  def refresh
    # event_id = Event.find_by(params[:event_id]).host_id
    # user_id = User.find_by(event_id:event_id).id
    oldToken = 'BQB60j3w0BbW-LSCbs6f4G9IMLSVNf2tyeX3qDsvkIBaXZxeAw1mPKWeXuYvqkxE8RiA8akfM6sPikgGaq_b4bGjFLWaK7XPkeLiRrAD-bxg4CoCeN8j_RZtYwNu8Vz8H1ThDBDE5EPOuFOUWu2TL-fCeGVw7n12kvxpU9Qu6cTxHR_1V_2sGfyqI2UXaSDH9JISRGQ0M2dLj5fBv_7Z5Dgvm_0vtp6XO4zmn4YxZvAWVmPnhGtRfG2bdU3IC7wdIpAspNFqwLwov4m2K36Xd1Cql4Is'
    res = HTTParty.post("https://accounts.spotify.com/api/token",:body =>{
        grant_type: 'refresh_token',
        refresh_token: oldToken,
        client_secret: '4fe90b825c294147be96f6181e4cc8bb',
        client_id: 'd2a6a11d756a4c4da594170cd80f425e'
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
