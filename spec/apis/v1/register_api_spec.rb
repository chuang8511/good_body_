require 'rails_helper'

RSpec.describe V1::RegisterAccountApi, type: :request do

    let(:path) { '/v1/register_account' }
    let(:double_register_account_user) { instance_double(RegisterAccountUser) }
    let(:mock_create_account_initialize) { allow(RegisterAccountUser).to receive(:new).and_return(double_register_account_user) }
    let(:stub_create_account) { allow(double_register_account_user).to receive(:create_account) }
  
    let(:params) { { account:"fake_account",password:"fake_password",name:"faker",email:"fake@mail.com",phone_number:"0912345678",age:18,gender: "fake_gender",height:180,weight:80 } }
  
  
    describe 'call API' do
  
      before do
        mock_create_account_initialize
        stub_create_account
      end
  
      it 'will initialize a RegisterAccountUserSpec' do
  
        expect(RegisterAccountUser).to receive(:new).once.with("fake_account","fake_password","faker","fake@mail.com","0912345678",18,"fake_gender",180,80)
        expect(double_register_account_user).to receive(:create_account).once
  
        post path, params: params
  
      end
  
    end
end