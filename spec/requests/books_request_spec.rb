RSpec.describe 'Books', type: :request do
  describe 'GET #index' do
    before { get '/books' }

    it { expect(response).to have_http_status(:success) }

    it 'renders the index template' do
      expect(response).to(render_template(:index))
    end
  end

  describe '#GET /categories/:id/books/:id' do
    let(:book) { create :book }

    before { get "/categories/#{book.category_id}/books/#{book.id}" }

    it { expect(response).to have_http_status(:success) }

    it 'renders the show template' do
      expect(response).to(render_template(:show))
    end
  end

  describe '#PUT /categories/:id/books/:id/calc_price' do
    let(:ok) { 200 }
    let(:book) { create :book }
    let(:headers) { { 'ACCEPT': 'application/json; charset=utf-8' } }

    before { put "/categories/#{book.category_id}/books/#{book.id}/calc_price", headers: headers }

    it { expect(response.status).to eq(ok) }

    it 'renders the json response' do
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end
  end
end
