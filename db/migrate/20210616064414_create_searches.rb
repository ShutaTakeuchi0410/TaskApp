class CreateSearches < ActiveRecord::Migration[6.1]
  def change
    create_table :searches do |t|
      t.string :word
      t.integer :column_type

      t.integer :user_id

      t.timestamps
    end
  end
end
