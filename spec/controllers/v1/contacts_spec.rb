require 'rails_helper'

describe V1::ContactsController, type: :controller do
    it 'request index and return 200 OK' do
        request.accept = 'application/json'
        get :index
        expect(response).to have_http_status(:ok)
      end
end 