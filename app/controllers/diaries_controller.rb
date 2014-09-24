class DiariesController < ApplicationController
  before_action :set_diary, only: [:show, :edit, :update, :destroy]

  def index
    @title = 'Дневник'
    @diaries = Diary.all
  end

  def show
    @notes = @diary.notes.sort_by{|s| s.created_at}
  end

  def new
    @diary = Diary.new
  end

  def edit
  end

  def create
    @diary = Diary.new(diary_params)

    respond_to do |format|
      if @diary.save
        format.html { redirect_to @diary, notice: 'Diary was successfully created.' }
        format.json { render action: 'show', status: :created, location: @diary }
      else
        format.html { render action: 'new' }
        format.json { render json: @diary.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @diary.update(diary_params)
        format.html { redirect_to @diary, notice: 'Diary was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @diary.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @diary.destroy
    respond_to do |format|
      format.html { redirect_to diaries_url }
      format.json { head :no_content }
    end
  end

  private
    def set_diary
      @diary = Diary.find(params[:id])
    end

    def diary_params
      params.require(:diary).permit(:title)
    end
end
