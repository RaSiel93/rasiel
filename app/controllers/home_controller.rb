class HomeController < ApplicationController
  def index
    session[:state] ||= Digest::MD5.hexdigest(rand.to_s)
    @vk_url = VkontakteApi.authorization_url(scope: [:offline, :notify, :audio, :photos], state: session[:state])
    @user = User.find_by_vk_id(session[:vk_id])
  end
end
