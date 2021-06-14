class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :content
      t.string :file

      t.integer :user_id
      t.integer :task_id

      t.timestamps
    end
  end
end