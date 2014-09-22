class UserController < ApplicationController

  def authorization
    require 'net/http'
    require 'json'

    if params[:code].present?
      response = Net::HTTP.get(URI.parse("https://oauth.vk.com/access_token?client_id=4557485&client_secret=1CPiSrcHxXWYTV7iWc9e&code=#{params[:code]}&redirect_uri=#{request.base_url}/authorization'"))
      result = JSON.parse response
      User.create(access_token: result['access_token'])
      redirect_to root_path
    end
  end
end

