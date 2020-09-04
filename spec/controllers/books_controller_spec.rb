require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  describe 'GET #index' do
    before do
      get :index
    end

    it { expect(response).to have_http_status(:success) }

    it 'renders the index template' do
      expect(response).to(render_template(:index))
    end
  end

  describe 'GET #show' do
    let(:book) { create(:book) }

    before do
      get :show, params: { id: book.id, category_id: book.category_id }
    end

    it { expect(response).to have_http_status(:success) }

    it 'renders the show template' do
      expect(response).to(render_template(:show))
    end
  end
end
