require 'rails_helper'

RSpec.describe V1::RecommendFollowerApi, type: :request do  #
  let(:path) { '/v1/recommend_follower' }  #
  let(:findfriend) { allow(RecommendFollow).to receive(:new) }
  let(:params) { { user_id:    1  } } #


  describe 'call API' do

    it 'friend recommendation' do
      post path, params: params

      expect(RecommendFollow).to receive(:new)
      expect(findfriend).to receive(:recomd).once.with(1, [2,3,4])

      

    end

  end

end