class CreateUserCategories < ActiveRecord::Migration
  def change
    create_table :user_categories do |t|
      t.integer :user_id, :category_id
      t.timestamps  
    end
  end
end
