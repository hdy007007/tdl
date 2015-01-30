class Category < ActiveRecord::Base
  has_many :todo_categories
  has_many :todos, through: :todo_categories

  has_many :user_categories
  has_many :users, through: :user_categories
end