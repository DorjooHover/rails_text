class AddUserIdToDatabases < ActiveRecord::Migration[6.1]
  def change
    add_column :databases, :user_id, :integer
    add_index :databases, :user_id
  end
end
