class Todo < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :todo_categories
  has_many :categories, through: :todo_categories

  validates :title, presence: true
  validates :description, presence: true
  validate :date_cannot_be_in_past 

  # scope :pinned, -> { where(time_pinned: Date.today) }
  # scope :unpinned, -> { where.not(time_pinned: [Date.today, nil]) }
  # scope :order_by_deadline, -> { order('deadline IS NULL, deadline ASC') }
  # scope :completed, -> { where(done: true) }
  # scope :not_completed, -> { where(done: [false, nil]) }

  def date_cannot_be_in_past
    if deadline && deadline < Time.now 
      errors.add(:deadline, 'Deadline cannot be in the past')
    end
  end

  def self.order_by_deadline
    results = []
    results << where(time_pinned: Date.today)
    results << order('deadline IS NULL, deadline ASC')
    results.flatten.uniq
  end

  def todo_done?
    done
  end

  def pinned?
    time_pinned == Date.today    
  end
end