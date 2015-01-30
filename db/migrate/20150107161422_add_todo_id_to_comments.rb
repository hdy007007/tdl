class AddTodoIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :todo_id, :integer
  end
end
