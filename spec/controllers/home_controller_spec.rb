require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe 'GET #home' do
    before { get :home }

    it { expect(response).to have_http_status(:success) }

    it 'renders the home template' do
      expect(response).to render_template('home')
    end
  end
end
