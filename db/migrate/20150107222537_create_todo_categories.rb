class CreateTodoCategories < ActiveRecord::Migration
  def change
    create_table :todo_categories do |t|
      t.integer :todo_id, :category_id
      t.timestamps
    end
  end
end
