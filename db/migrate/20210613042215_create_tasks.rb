class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :title, nil: false
      t.datetime :deadline #締切日
      t.text :detail #詳細
      t.integer :priority #優先度

      t.integer :user_id

      t.timestamps
    end
  end
end
