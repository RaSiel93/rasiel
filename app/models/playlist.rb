class Playlist < ActiveRecord::Base
  belongs_to :user
  has_many :audios

  def to_player
    audios.map{|audio| audio.to_player }.join(', ')
  end

  def empty
    audios.map{|audio| audio.destroy }
  end
end
