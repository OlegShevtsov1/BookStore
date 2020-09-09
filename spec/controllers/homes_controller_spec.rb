require 'rails_helper'

RSpec.describe HomesController, type: :controller do
  describe 'GET #home' do
    let(:books_presenter) { instance_double('BooksPresenter') }

    before do
      allow(BooksPresenter).to receive(:new).and_return(books_presenter)
      get :index
    end

    it { expect(response).to have_http_status(:success) }

    it 'renders the home template' do
      expect(response).to(render_template(:index))
    end

    context 'with assigns' do
      let(:books_presenter1) { BooksPresenter.new({}) }

      it 'assigns @books_presenter variable' do
        expect(assigns[:books_presenter]).to eq(books_presenter1)
      end
    end
  end
end
