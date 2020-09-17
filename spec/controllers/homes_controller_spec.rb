RSpec.describe HomesController, type: :controller do
  before do
    stub_const('COUNT_LAST_BOOKS', 3)
    get :index
  end

  describe 'GET #index' do
    it { expect(response).to have_http_status(:success) }

    it 'renders the index template' do
      expect(response).to(render_template(:index))
    end

    context 'with assigns' do
      it 'assigns @books_slider variable' do
        expect(assigns[:books_slider]).to eq(Book.includes(:authors).last(COUNT_LAST_BOOKS))
      end
    end
  end
end
