RSpec.describe Book, type: :model do
  let(:book) { create(:book) }

  describe 'has associations' do
    it { is_expected.to have_many(:book_authors) }
    it { is_expected.to have_many(:authors).through(:book_authors) }
    it { is_expected.to belong_to(:category) }
  end

  describe 'has validations' do
    it { is_expected.to validate_presence_of(:name) }

    it 'description min size' do
      stub_const('MIN_DESCRIPTION_SIZE', 50)
      expect(book).to validate_length_of(:description).is_at_least(MIN_DESCRIPTION_SIZE)
    end
  end
end
