RSpec.describe Calculators::BooksCalculatorService do
  let(:book) { create(:book) }
  let(:params) { { amount: 1, change: 'plus' } }

  let(:service) { described_class.new(book: book, params: params) }

  describe '#call' do
    it 'returns hash' do
      expect(service.call.class).to eq(Hash)
    end
  end
end
