class DiariesController < ApplicationController
  def new
    @diary = Diary.new
  end

  def create
    @diary = Diary.new(diary_params)
    @diary.user_id = current_user.id
    if @diary.save
      redirect_to diaries_path
    else
      render :new
    end
  end

  def index
    @diary = Diary.all
  end

  def show
    @diary = Diary.find(params[:id])
  end

  def edit
    # @diary = Diary.find(params[:id])
  end

  def update
    # @diary = Diary.find(params[:id])
    # @diary.update(diary_params)
    # redirect_to diary_path(diaries.id)
  end

  def destroy
    @diary = Diary.find(params[:id])
    @diary.destroy
    redirect_to diaries_path
  end

  private

  def diary_params
    params.require(:diary).permit(:comment)
  end
end
