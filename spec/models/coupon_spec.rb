RSpec.describe Coupon, type: :model do
  describe 'has assosiations' do
    it { is_expected.to have_one(:order) }
  end

  describe 'has validations' do
    it { is_expected.to validate_presence_of(:code) }
  end
end
