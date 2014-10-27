class UserController < ApplicationController
  before_filter :set_vk_client, only: [:load_playlist, :authorization, :update_vk_playlist]
  layout false

  def authorization
    redirect_to root_path, alert: 'Ошибка авторизации' if params[:state] != session[:state]
    @vk = VkontakteApi.authorize(code: params[:code])
    redirect_to root_path
  end

  def load_playlist
    @playlist = @user.vk_playlist.to_player
  end

  def update_vk_playlist
    # @user.vk_playlist.empty
    # @vk.audio.get.each do |audio|
    #   audio = Audio.new(audio.slice(:title, :artist, :url))
    #   audio.playlist = @user.vk_playlist
    #   audio.save
    # end
    @playlist = @user.vk_playlist.to_player
  end

  private

  def set_vk_client
    @user = User.find_by_vk_id(session[:vk_id])
    @vk = VkontakteApi::Client.new(@user.access_token)
  end
end

