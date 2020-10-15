RSpec.describe BookDecorator do
  let(:book) { create :book }

  describe '#authors' do
    let(:template) { book.authors.decorate.map(&:name).join ', ' }

    it 'returns string' do
      expect(book.decorate.authors.class).to eq(String)
    end

    it 'returns string template' do
      expect(book.decorate.authors).to eq(template)
    end
  end

  describe '#properties' do
    let(:template) { "H:#{book.heigth}\" x W: #{book.width}\" x D: #{book.depth}" }

    it 'returns string' do
      expect(book.decorate.properties.class).to eq(String)
    end

    it 'returns string template' do
      expect(book.decorate.properties).to eq(template)
    end
  end

  describe '#short_description' do
    let(:template) { book.decorate.description[0..described_class::DESCRIPTION_LIMIT].to_s }

    it 'returns string' do
      expect(book.decorate.short_description.class).to eq(String)
    end

    it 'returns string template' do
      expect(book.decorate.short_description).to eq(template)
    end
  end

  describe '#description_lenght_short?' do
    context 'when description length is short ' do
      let(:book) { create(:book, :with_short_description) }
      let(:presenter) { described_class.new(book) }

      it { expect(book.decorate.description_length_short?).to be(true) }
    end

    context 'when description length is not short ' do
      let(:book) { create(:book, :with_long_description) }
      let(:presenter) { described_class.new(book) }

      it { expect(book.decorate.description_length_short?).to be(false) }
    end
  end
end
