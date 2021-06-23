class ChangeDatatypeDoneDateOfTasks < ActiveRecord::Migration[6.1]
  def change
    change_column :tasks, :done_date, :date
  end
end
