require 'rails_helper'

RSpec.describe Author, type: :model do
  describe 'has associations' do
    it { is_expected.to have_many(:book_authors) }
    it { is_expected.to have_many(:books).through(:book_authors).dependent(:destroy) }
  end
end
