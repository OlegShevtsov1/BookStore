RSpec.describe CommentDecorator do
  let(:comment) { create :comment }

  describe '#comment_date' do
    it 'returns string' do
      expect(comment.decorate.date.class).to eq(String)
    end
  end

  describe '#user_name' do
    it 'returns string' do
      expect(comment.decorate.user_name.class).to eq(String)
    end
  end

  describe '#empty_stars_count' do
    it 'returns string' do
      expect(comment.decorate.empty_stars_count.class).to eq(Integer)
    end
  end

  describe '#verified_reviewer' do
    it 'returns string' do
      expect(comment.decorate.verified_reviewer.class).to eq(String)
    end

    it 'returns string template' do
      expect(comment.decorate.verified_reviewer).to eq(I18n.t('books.show.review.verified_reviewer'))
    end
  end
end
