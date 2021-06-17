class SearchesController < ApplicationController
  def index
    @q = Task.ransack(params[:q])
    # @tasks = @q.result(distinct: true)
  end

  def search
    @q = current_user.tasks.search(search_params)
    @tasks = @q.result(distinct: true)
  end

  private

  def search_params
    params.require(:q).permit!
  end
end
