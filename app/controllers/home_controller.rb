class HomeController < ApplicationController
  def index
    @title = 'Главная'
    @users = User.all
  end
end
