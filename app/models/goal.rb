class Goal < ApplicationRecord
  belongs_to :user
  validates :description, presence: true
  validates :priority, numericality: true
  validates :progress_percent, numericality: { greater_than_or_equal_to: 0,
                                               less_than_or_equal_to: 100}
  
end
