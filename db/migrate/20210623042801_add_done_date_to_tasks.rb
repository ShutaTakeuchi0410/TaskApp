class AddDoneDateToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :done_date, :datetime
  end
end
