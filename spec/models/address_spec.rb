RSpec.describe Address, type: :model do
  describe 'has associations' do
    it { is_expected.to belong_to(:user) }
  end
end
