RSpec.describe Cart::ItemCreateService do
  let(:current_user) { create(:user) }
  let(:order) { create(:order) }
  let(:book) { create(:book) }
  let(:params) { { current_item: book.id, quantity: 1 } }

  describe 'item create' do
    context 'when success' do
      subject(:service) { described_class.new(current_user, items_form, params) }

      let(:items_form) { { current_item: book.id, quantity: 1 } }

      it 'item create' do
        expect { service.call(order) }.to change(Item, :count).from(0).to(1)
      end
    end

    context 'when filed' do
      subject(:service) { described_class.new(current_user, nil, params) }

      it 'item not create' do
        expect(service.call(order)).to eq(nil)
      end

      it 'item not change counts' do
        expect(Item.count).to eq(0)
      end
    end
  end
end
