class User < ActiveRecord::Base
  has_many :playlists

  def vk_playlist
    playlists.find_by_title('vk')
  end
end
