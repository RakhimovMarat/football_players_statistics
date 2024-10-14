class Match < ApplicationRecord
  validates :match_date, :match_importance, presence: true

  has_many :statistics
end
