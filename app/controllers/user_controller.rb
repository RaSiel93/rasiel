class UserController < ApplicationController

  def authorization
    require 'net/http'
    require 'json'

    if params[:code].present?
      response = JSON.parse Net::HTTP.get(URI.parse("https://oauth.vk.com/access_token?client_id=#{Settings.client_id}&client_secret=#{Settings.client_secret}&code=#{params[:code]}&redirect_uri=#{authorization_url}"))
      User.create(access_token: response['access_token'])
    end
    redirect_to root_path
  end
end

