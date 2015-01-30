class AddColsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :created_at, :datetime
    add_column :users, :updated_at, :datetime
    add_column :users, :email, :string
    add_column :users, :sms, :string
  end
end
