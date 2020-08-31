require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'has associations' do
    it { is_expected.to have_many(:books) }
  end
end
