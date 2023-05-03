require 'rails_helper'

RSpec.describe V1::RecommendTxtApi, type: :request do  #

  let(:path) { '/v1/recommend_txt' }  #
  let(:double_find_txt) { instance_double(RecommendTxt) }
  let(:params) { { user_id:  "fake_id" } } #

  let(:mock_new) { allow(RecommendTxt).to receive(:new).and_return(double_find_txt) }
  let(:stub_txt_recommend) { allow(double_find_txt).to receive(:find_txt_recommend) }

  describe 'call API' do

    before do
      mock_new
      stub_txt_recommend
    end

    it 'friend recommendation' do

      allow(RecommendTxt).to receive(:new)
      allow(double_find_txt).to receive(:find_txt_recommend).once.with( 'fake' )

      post path, params: params

    end

  end

end
