class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :title
      t.text :description
      t.datetime :deadline
      t.boolean :notifications
      t.integer :user_id
      t.timestamps
    end
  end
end
