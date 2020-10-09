RSpec.describe Calculators::OrderCalculatorService do
  let(:book) { create(:book) }
  let(:params) { { book_id: book.id, amount: 1, change: 'plus' } }
  let(:current_order) { create(:order) }

  let(:service) { described_class.new(order: current_order, params: params) }

  describe '#call' do
    before do
      create(:item, order_id: current_order.id, book_id: book.id)
    end

    it 'returns hash' do
      expect(service.call.class).to eq(Hash)
    end
  end
end
