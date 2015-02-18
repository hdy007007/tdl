class AddPinnedToTodos < ActiveRecord::Migration
  def change
    add_column :todos, :pinned, :boolean 
  end
end
