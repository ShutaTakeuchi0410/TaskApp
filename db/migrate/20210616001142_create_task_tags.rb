class CreateTaskTags < ActiveRecord::Migration[6.1]
  def change
    create_table :task_tags do |t|
      t.integer :task_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
