class Tag < ApplicationRecord
  validates :name, presence: true
  validates :name, length: { maximum: 100 }

  belongs_to :user

  has_many :task_tags, :dependent => :destroy
  has_many :tasks, through: :task_tags
end
