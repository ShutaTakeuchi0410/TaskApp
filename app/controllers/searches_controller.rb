class SearchesController < ApplicationController

  # 検索フォーム用インスタンスを生成
  def new
    @search = Search.new

    # 検索履歴５件
    @searches = current_user.searches.all.order('id DESC').limit(5)
  end
  
  # 検索ワードを保存する
  def create
    @search = current_user.searches.new(search_params)
    if @search.save
      # 検索結果を表示したい(GETで結果を表示させる)
      redirect_to action: :show_result
    else
      # 検索履歴５件
      @searches = current_user.searches.all.order('id DESC').limit(5)
      render :new
    end
  end

  private

  def search_params
    params.require(:search).permit(:word, :column_type)
  end
end
