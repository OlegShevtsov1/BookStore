require 'rails_helper'

RSpec.describe 'Home', type: :request do
  describe 'GET #home' do
    before { get '/' }

    it { expect(response).to have_http_status(:success) }

    it 'renders the home template' do
      expect(response).to(render_template(:home))
    end
  end
end
