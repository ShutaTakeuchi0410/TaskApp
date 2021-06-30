class Project < ApplicationRecord
  validates :name, presence: true
  validates :name, length: { maximum: 100 }
  # validates :name, uniqueness: true

  has_many :tasks
end