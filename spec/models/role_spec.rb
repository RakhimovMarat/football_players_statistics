require 'rails_helper'

RSpec.describe Role, type: :model do
  describe 'associations' do
    it { should have_many :statistics }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of :name }
  end
end
