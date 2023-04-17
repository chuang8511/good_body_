require 'rails_helper'

RSpec.describe V1::LoginApi, type: :request do

  let(:mock_uuid) { allow(SecureRandom).to receive(:uuid).and_return("fake_uuid") }
  let(:path) { '/v1/login' }
  let(:double_login_user) { instance_double(LoginUser) }
  let(:mock_login_initialize) { allow(LoginUser).to receive(:new).and_return(double_login_user) }
  let(:stub_login) { allow(double_login_user).to receive(:login) }

  let(:params) { { email:    'fake_email',
                   password: 'fake_password' } }


  describe 'call API' do

    before do
      mock_uuid
      mock_login_initialize
      stub_login
    end

    it 'will initialize a LoginUserSpec' do

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