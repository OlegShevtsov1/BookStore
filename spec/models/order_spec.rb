RSpec.describe Order, type: :model do
  describe 'has associations' do
    it { is_expected.to have_many(:items) }
    it { is_expected.to have_many(:books).through(:items) }
  end
end
