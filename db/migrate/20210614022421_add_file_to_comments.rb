class AddFileToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :file, :string
  end
end
