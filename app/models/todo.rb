class Todo < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :todo_categories
  has_many :categories, through: :todo_categories

  validates :title, presence: true
  validates :description, presence: true
  validate :date_cannot_be_in_past 

  def date_cannot_be_in_past
    if deadline && deadline < Time.now 
      errors.add(:deadline, 'Deadline cannot be in the past')
    end
  end

  def self.order_by_deadline
    group1 = []
    group1 << where(pinned: true)

    group2 = []
    group2 << order('deadline IS NULL, deadline ASC')

    todos = [group1, group2].flatten.uniq
    todos
  end

  def todo_done?
    done
  end

end