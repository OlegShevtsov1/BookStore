RSpec.describe AuthorDecorator do
  let(:author) { create :author }

  describe '#name' do
    it 'returns string' do
      expect(author.decorate.name.class).to eq(String)
    end
  end
end
