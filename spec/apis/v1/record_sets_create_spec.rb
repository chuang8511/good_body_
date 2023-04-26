require 'rails_helper'

RSpec.describe V1::LoginApi, type: :request do

    describe 'call API' do

        before do
          mock_uuid
          mock_login_initialize
          stub_login
        end
    
        it 'will initialize a ' do
    
          expect(LoginUser).to receive(:new).once.with("fake_uuid", "fake_email")
          expect(double_login_user).to receive(:login).once.with('fake_password')
    
          post path, params: params
    
        end
    
        it 'will get status 201' do
          post path, params: params
          expect(response.status).to eq 201
        end
    
      end


end