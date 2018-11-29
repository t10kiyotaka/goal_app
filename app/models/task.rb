class Task < ApplicationRecord
  belongs_to :user
  belongs_to :goal
  validates :description, presence: true
  validates :priority, numericality: { only_integer: true }
  validates :progress_percent, numericality: { greater_than_or_equal_to: 0,
                                               less_than_or_equal_to: 100,
                                               only_integer: true }

end
