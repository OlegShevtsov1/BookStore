RSpec.describe Shipping, type: :model do
  describe 'has associations' do
    it { is_expected.to have_many(:orders).dependent(:nullify) }
  end

  describe 'has validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:price) }
  end
end
