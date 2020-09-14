RSpec.describe 'Homes', type: :request do
  describe 'GET #index' do
    before { get '/' }

    it { expect(response).to have_http_status(:success) }

    it 'renders the home template' do
      expect(response).to(render_template(:index))
    end
  end
end
