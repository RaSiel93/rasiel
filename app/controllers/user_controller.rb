class UserController < ApplicationController
  before_filter :set_vk_client, only: [:load_playlist, :authorization]
  layout false

  def authorization
    require 'net/http'
    require 'json'

    if params[:code].present?
      response = JSON.parse Net::HTTP.get(URI.parse("https://oauth.vk.com/access_token?client_id=#{Settings.client_id}&client_secret=#{Settings.client_secret}&code=#{params[:code]}&redirect_uri=#{authorization_url}"))
      User.create(access_token: response['access_token'])
    end
    redirect_to root_path
  end

  def load_playlist
    playlist = @vk.audio.get.map{|a| "{title: '#{a[:artist]} - #{a[:title]}', mp3: '#{a[:url]}'}"}.join(', ')
    respond_to do |format|
      format.js {render 'load_playlist', :locals => {playlist: playlist}}
    end
  end

  private

  def set_vk_client
    @vk = VkontakteApi::Client.new('2cf52728c34a37c64843ea464bcf36ab5d587f0d547c9c8915927d9e70d5981bbe61643c304148d935c19')
  end
end

