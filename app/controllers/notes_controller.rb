class NotesController < ApplicationController
  before_action :set_diary

  def index
    @notes = Note.where(diary: @diary).order(:date)
  end

  def show
    @note = Note.find(params[:id])
  end

  private

  def set_diary
    @diary = Diary.find_by_id(params[:diary_id])
  end
end
