class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]
  before_action :set_diary

  def index
    @notes = Note.where(diary: @diary, published: true).order(:date)
    @notes = Note.where(diary: @diary).order(:date) if params.has_key? 'all'
  end

  def show
  end

  def new
    @note = Note.new
    @note.diary = @diary
  end

  def edit
  end

  def create
    @note = @diary.notes.new(note_params)

    respond_to do |format|
      if @note.save
        format.html { redirect_to [@diary, @note], notice: 'Note was successfully created.' }
        format.json { render action: 'show', status: :created, location: @note }
      else
        format.html { render action: 'new' }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to [@diary, @note], notice: 'Note was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to @diary }
      format.json { head :no_content }
    end
  end

  private
    def set_note
      @note = Note.find(params[:id])
    end

    def set_diary
      @diary = Diary.find_by_id(params[:diary_id])
    end

    def note_params
      params.require(:note).permit(:title, :text)
    end
end
