RSpec.describe Book, type: :model do
  describe 'has associations' do
    it { is_expected.to have_many(:book_authors) }
    it { is_expected.to have_many(:authors).through(:book_authors) }
    it { is_expected.to belong_to(:category) }
  end
end
