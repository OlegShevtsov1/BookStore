RSpec.describe Shipping, type: :model do
  describe 'has associations' do
    it { is_expected.to have_many(:orders).dependent(:nullify) }
  end
end
