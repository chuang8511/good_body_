require 'rails_helper'

RSpec.describe V1::RecommendFollowerApi, type: :request do  #
  let(:mock_uuid) { allow(RecommendFollow).to receive(:uuid).and_return("fake_uuid") }
  let(:path) { '/v1/recommend_follower' }  #
  let(:double_friend_recomd) { instance_double(RecommendFollow) } 
  let(:mock_friend_recomd) { allow(RecommendFollow).to receive(:new).and_return(double_friend_recomd) }
  let(:stub_friend_recomd) { allow(double_login_user).to receive(:findfriend) }

  let(:params) { { user_id:    'fake_user_id' } } #


  describe 'call API' do

    before do
      mock_uuid
      mock_login_initialize
      stub_login
    end

    it 'will initialize a LoginUserSpec' do

      expect(RecommendFollow).to receive(:new).once.with('fake_user_id' )

      post path, params: params

    end

  end


end