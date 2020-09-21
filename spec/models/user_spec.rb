RSpec.describe User, type: :model do
  describe 'has associations' do
    it { is_expected.to have_many(:addresses) }
    it { is_expected.to have_many(:comments) }
  end
end
