class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, uniqueness: true
  has_many :goals, dependent: :destroy
  has_many :tasks, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  def owned_comment?(comment)
    self.comments.include?(comment) ? true : false
  end

end
