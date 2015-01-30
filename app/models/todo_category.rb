class TodoCategory < ActiveRecord::Base
  belongs_to :todo
  belongs_to :category
end