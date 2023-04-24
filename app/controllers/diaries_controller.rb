class DiariesController < ApplicationController
  def new
    @diary = Diary.new
  end
  
  def create
    @diary = Diary.new(diary_params)
    @diary.user_id = current_user.id
    @diary.save
    redirect_to post_images_path
  end

  def index
  end

  def show
  end

  def destroy
  end

  
  # 投稿データのストロングパラメータ
  private

  def diary_params
    params.require(:diary).permit(:comment)
  end
end
