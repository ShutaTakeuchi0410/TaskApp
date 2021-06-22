class SearchesController < ApplicationController
  def index
    @q = current_user.tasks.ransack(params[:q])

    # 検索履歴の表示
    @histories = current_user.searches.all.order(id: "DESC").limit(5)
  end

  def search

    # 検索ワードの表示
    @word = params[:q][:title_or_detail_or_tags_name_cont]

    # 完了済みでないタスクのみを表示
    @q = current_user.tasks.where(status: false).search(search_params)
    @tasks = @q.result(distinct: true)

    # 検索履歴の保存
    if @word.present?
      @search = current_user.searches.new
      @search.word = @word
      @search.save
      # NOTE: 検索履歴は最新5件までを残すようにするので、6件目以降は削除する
      # current_user.searches.order(created_at: :desc).offset(5).delete_all if current_user.searches.size >= 6
      # current_user.keep_latest_5_logs!
    end
  end

  private

  def search_params
    params.require(:q).permit!
  end
end
