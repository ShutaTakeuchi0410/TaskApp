class TagsController < ApplicationController

  def show
    @tag = Tag.find(params[:id])

    # 並び替え
    if params[:sort_type] == 'priority'
      @value = 'priority'
      @tasks = @tag.tasks.where(status: false).order(priority: "ASC")
    else
      @value = 'deadline'
      @tasks = @tag.tasks.where(status: false).order(deadline: "ASC")
    end
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    @tag.user_id = current_user.id

    # if @tag.save
    #   redirect_to home_path
    # else
    #   render :new
    # end

    respond_to do |format|
      if @tag.save
        format.html { redirect_to new_tag_path, notice: 'タグを一件追加しました' }
        # format.json { render :show, status: :created, location: @task }
        # 追加
        # format.js { @status = "success" }
      else
        format.html { render :new }
        # format.json { render json: @task.errors, status: :unprocessable_entity }
        # 追加
        # format.js { @status = "fail" }
        format.js { render :new }
      end
    end
  end

  def destroy
    tag = Tag.find(params[:id])
    tag.destroy
    redirect_to home_path
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end
end
