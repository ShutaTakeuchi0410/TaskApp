class Search < ApplicationRecord
  belongs_to :user

  # 検索履歴は最新の５件までを必要とするため、６件目以降を削除する
  def self.keep_latest_5_logs
    logs = self.order(created_at: :desc).offset(5)
    logs.destroy_all
  end
end
