require 'rails_helper'

RSpec.describe V1::FollowApi, type: :request do
    let(:path) { '/v1/follow' }
    let(:double_follow_user) { instance_double(FollowAndUnfollowUser) }
    let(:mock_follow_initialize) { allow(FollowAndUnfollowUser).to receive(:new).and_return(double_follow_user) }
    let(:stub_follow) { allow(double_follow_user).to receive(:follow) }
  
    let(:params) { { subject_user_account:    'fake_subject_user_account',
                     object_user_account: 'fake_object_user_account' } }

        describe 'call API' do

        before do
            mock_follow_initialize
            stub_follow
        end

        it 'will initialize a FollowAndUnfollowUserSpec' do

            expect(FollowAndUnfollowUser).to receive(:new).once.with("fake_subject_user_account")
            expect(double_follow_user).to receive(:follow).once.with('fake_object_user_account')

            post path, params: params

        end

        end

end