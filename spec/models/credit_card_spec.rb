require 'rails_helper'

RSpec.describe CreditCard, type: :model do
  describe 'has assosiations' do
    it { is_expected.to belong_to(:order) }
  end
end
