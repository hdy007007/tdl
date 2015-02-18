class RemovePinnedFromTodos < ActiveRecord::Migration
  def change
    remove_column :todos, :pinned, :boolean
  end
end
