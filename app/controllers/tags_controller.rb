class TagsController < ApplicationController

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    @tag.user_id = current_user.id

    if @tag.save
      redirect_to home_path
    else
      render :new
    end
  end

  def show
    @tag = Tag.find(params[:id])
    @tasks = @tag.tasks
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end
end
