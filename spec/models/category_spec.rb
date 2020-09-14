RSpec.describe Category, type: :model do
  describe 'has associations' do
    it { is_expected.to have_many(:books) }
  end

  describe 'has validations' do
    it { is_expected.to validate_presence_of(:name) }
  end
end
