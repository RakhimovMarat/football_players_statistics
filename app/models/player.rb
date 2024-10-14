class Player < ApplicationRecord
  validates :name, presence: true

  belongs_to :team
  has_many :statistics

  enum role: { goalkeeper: 0, defender: 1, midfielder: 2, forward: 3 }
end
