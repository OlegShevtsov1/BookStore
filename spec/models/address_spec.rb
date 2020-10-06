RSpec.describe Address, type: :model do
  describe 'has associations' do
    it { is_expected.to belong_to(:user) }

    describe 'validation' do
      let(:test_user) { create(:user) }

      context 'with valid address_type' do
        let(:address_type) { 'billing' }
        let(:address) { described_class.new(address_type: address_type, user_id: test_user.id) }

        it 'returns true' do
          expect(address.valid?).to be true
        end
      end

      context 'with invalid address_type' do
        let(:address_type) { 'hello' }
        let(:address) { described_class.new(address_type: address_type, user_id: test_user.id) }

        it 'raises error' do
          expect { address }.to raise_error(ArgumentError)
        end
      end
    end
  end
end
