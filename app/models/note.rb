class Note < ActiveRecord::Base
  belongs_to :diary

  def title
    super.present? ? super : self.date
  end
end
