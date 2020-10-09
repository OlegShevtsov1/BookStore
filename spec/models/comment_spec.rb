RSpec.describe Comment, type: :model do
  describe 'has assosiations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:book) }
  end

  describe 'has validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:review) }
  end
end
