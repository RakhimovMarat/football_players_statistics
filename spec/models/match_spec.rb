require 'rails_helper'

RSpec.describe Match, type: :model do
  describe 'associations' do
    it { should have_many :statistics }
  end

  describe 'validations' do
    it { should validate_presence_of :match_date }
    it { should validate_presence_of :match_importance }
  end
end
