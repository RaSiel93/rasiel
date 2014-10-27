class Audio < ActiveRecord::Base
  belongs_to :playlist

  def to_player
    "{title: '#{artist.gsub('\'', '`')} - #{title.gsub('\'', '`')}', mp3: '#{url.gsub('\'', '`')}'}"
  end
end
