RSpec.describe Item, type: :model do
  describe 'has associations' do
    it { is_expected.to belong_to(:book) }
    it { is_expected.to belong_to(:order) }
  end
end
