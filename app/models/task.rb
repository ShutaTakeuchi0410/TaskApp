class Task < ApplicationRecord
  validates :title, presence: true
  validates :title, length: { maximum: 100 }
  validates :detail, length: { maximum: 500 }
  
  belongs_to :user
  # project_id変更時のnilを許可する
  belongs_to :project, optional: true

  has_many :comments, :dependent => :destroy
  has_many :task_tags, :dependent => :destroy
  has_many :tags, through: :task_tags

  # 7日より前に完了済みのタスクを削除
  def self.keep_tasks_7days
    # ７日前の日付を取得
    day_7_ago = Date.today - 7
    day_7_ago.strftime('%Y/%m/%d')

    tasks = self.where(status: true).where("done_date < ?", day_7_ago)
    tasks.destroy_all
  end
end