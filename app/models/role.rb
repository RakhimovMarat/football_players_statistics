class Role < ApplicationRecord
  validates :name, presence: true

  has_many :statistics
end
