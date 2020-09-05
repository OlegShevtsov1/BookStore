require 'rails_helper'

RSpec.describe 'Home', type: :request do
  describe 'GET #home' do
    before do
      create_list :book, HomeController::COUNT_LAST_BOOKS
      get '/'
    end

    it { expect(response).to have_http_status(:success) }

    it 'renders the index template' do
      expect(response).to(render_template(:home))
    end

    context 'with assigns' do
      let(:books_presenter1) { BooksPresenter.new({}) }

      it 'last 3 books to slide' do
        expect(assigns(:books_slider))
          .to match_array(Book.includes(:authors).last(HomeController::COUNT_LAST_BOOKS))
      end
    end
  end
end
