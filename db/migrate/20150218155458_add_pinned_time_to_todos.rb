class AddPinnedTimeToTodos < ActiveRecord::Migration
  def change
    add_column :todos, :time_pinned, :date
  end
end
