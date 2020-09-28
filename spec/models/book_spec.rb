RSpec.describe Book, type: :model do
  let(:book) { create(:book) }

  describe 'has associations' do
    it { is_expected.to have_many(:book_authors) }
    it { is_expected.to have_many(:authors).through(:book_authors) }
    it { is_expected.to have_many(:items) }
    it { is_expected.to have_many(:orders).through(:items) }
    it { is_expected.to belong_to(:category) }
    it { is_expected.to have_many(:comments) }
    it { is_expected.to have_many(:book_images) }
  end

  describe 'has validations' do
    it { is_expected.to validate_presence_of(:name) }

    it 'description min size' do
      stub_const('MIN_DESCRIPTION_SIZE', 50)
      expect(book).to validate_length_of(:description).is_at_least(MIN_DESCRIPTION_SIZE)
    end
  end

  describe 'scopes' do
    it 'when orders by ascending name' do
      expect(described_class.name_a_z.to_sql).to eq described_class.all.order(name: :asc).to_sql
    end

    it 'when orders by descending name' do
      expect(described_class.name_z_a.to_sql).to eq described_class.all.order(name: :desc).to_sql
    end

    it 'when orders by newest first' do
      expect(described_class.newest_first.to_sql).to eq described_class.all.order(id: :desc).to_sql
    end

    it 'when orders by popular first' do
      expect(described_class.popular_first.to_sql).to eq described_class.all.order(id: :desc).to_sql
    end
  end
end
