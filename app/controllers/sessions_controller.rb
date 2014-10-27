# encoding: utf-8
class SessionsController < ApplicationController
  def callback
    if session[:state] != params[:state]
      redirect_to root_url, alert: 'Ошибка авторизации, попробуйте войти еще раз.'
      return
    end
    @vk = VkontakteApi.authorize(code: params[:code])
    initialize_user
    @user.update_attribute(:access_token, @vk.token)
    session[:token] = @user.access_token
    session[:vk_id] = @user.vk_id
    redirect_to root_url
  end

  def destroy
    session[:token] = nil
    session[:vk_id] = nil
    redirect_to root_url
  end

  private

  def initialize_user
    return if @user = User.find_by_vk_id(@vk.user_id)
    info = @vk.users.get.first
    @user = User.create(first_name: info[:first_name], last_name: info[:last_name], access_token: @vk.token, vk_id: @vk.user_id)
    Playlist.create(title: 'vk', user: @user)
  end
end
