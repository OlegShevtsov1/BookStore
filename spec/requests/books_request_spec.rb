require 'rails_helper'

RSpec.describe 'Books', type: :request do
  describe 'GET #index' do
    before { get '/books' }

    it { expect(response).to have_http_status(:success) }

    it 'renders the index template' do
      expect(response).to(render_template(:index))
    end
  end
end
