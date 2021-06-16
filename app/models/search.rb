class Search < ApplicationRecord
  validates :word, presence: true

  belongs_to :user
end
