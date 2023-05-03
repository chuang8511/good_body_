require 'rails_helper'

RSpec.describe V1::RecommendFollowerApi, type: :request do  #
  let(:path) { '/v1/recommend_follower' }  #
  let(:findfriend) { allow(RecommendFollow).to receive(:new) }
  let(:params) { { user_id:    "fake id" } } #
  #let(:stub_login) { allow(double_login_user).to receive(:login) }


  describe 'call API' do

    it 'friend recommendation' do
      post path, params: params

      allow(RecommendFollow).to receive(:new)
      allow(findfriend).to receive(:recomd).once.with( "fake id" , [2,3,4])

    end

  end

end