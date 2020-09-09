require 'rails_helper'

RSpec.describe 'Homes', type: :request do
  describe 'GET #index' do
    before do
      create_list :book, HomesController::COUNT_LAST_BOOKS
      get '/'
    end

    it { expect(response).to have_http_status(:success) }

    it 'renders the index template' do
      expect(response).to(render_template(:index))
    end

    context 'with assigns' do
      let(:books_presenter1) { BooksPresenter.new({}) }

      it 'last 3 books to slide' do
        expect(assigns(:books_slider))
          .to match_array(Book.includes(:authors).last(HomesController::COUNT_LAST_BOOKS))
      end
    end
  end
end
