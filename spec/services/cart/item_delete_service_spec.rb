require 'rails_helper'

RSpec.describe Cart::ItemDeleteService do
  let(:current_user) { create(:user) }
  let!(:current_order) { create(:order, user_id: current_user.id) }
  let(:book) { create(:book) }

  before do
    create(:item, order_id: current_order.id, book_id: book.id)
  end

  describe 'item delete' do
    context 'when success' do
      subject(:service) { described_class.new(current_order, params_success) }

      let(:params_success) { { id: book.id } }

      it 'delete success' do
        expect { service.call }.to change(Item, :count).from(1).to(0)
      end
    end

    context 'when failed' do
      subject(:service) { described_class.new(current_order, params_failed) }

      let(:params_failed) { { id: book.id } }

      it 'not delete' do
        expect(Item.count).to eq(1)
      end
    end
  end
end
