RSpec.describe Order, type: :model do
  describe 'has associations' do
    it { is_expected.to have_many(:items) }
    it { is_expected.to have_many(:books).through(:items) }
    it { is_expected.to belong_to(:coupon).optional(true) }
    it { is_expected.to belong_to(:shipping).optional(true) }
  end
end
