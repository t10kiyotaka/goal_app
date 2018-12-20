class Goal < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  validates :description, presence: true
  validates :priority, presence: true, numericality: { only_integer: true }
  validates :progress_percent, presence: true, numericality: { greater_than_or_equal_to: 0,
                                               less_than_or_equal_to: 100,
                                               only_integer: true }
  validates :start_date, presence: true
  validates :end_date, presence: true
end
