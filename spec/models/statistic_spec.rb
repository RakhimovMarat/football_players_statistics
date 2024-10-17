require 'rails_helper'

RSpec.describe Statistic, type: :model do
  describe 'associations' do
    it { should belong_to :player }
    it { should belong_to :match }
    it { should belong_to :role }
  end
end
