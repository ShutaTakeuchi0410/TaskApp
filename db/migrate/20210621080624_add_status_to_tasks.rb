class AddStatusToTasks < ActiveRecord::Migration[6.1]
  def change
    # タスクが完了しているかどうかの判断用カラム(デフォルトではfalseで未完了を示す)
    add_column :tasks, :status, :boolean, default: false, null: false
  end
end
