require 'rails_helper'

RSpec.describe V1::FollowApi, type: :request do
    let(:path) { '/v1/unfollow' }
    let(:double_unfollow_user) { instance_double(FollowAndUnfollowUser) }
    let(:mock_unfollow_initialize) { allow(FollowAndUnfollowUser).to receive(:new).and_return(double_unfollow_user) }
    let(:stub_unfollow) { allow(double_unfollow_user).to receive(:unfollow) }
  
    let(:params) { { subject_user_account:    'fake_subject_user_account',
                     object_user_account: 'fake_object_user_account' } }

        describe 'call API' do

        before do
            mock_unfollow_initialize
            stub_unfollow
        end

        it 'will initialize a FollowAndUnfollowUserSpec' do

            expect(FollowAndUnfollowUser).to receive(:new).once.with("fake_subject_user_account")
            expect(double_unfollow_user).to receive(:unfollow).once.with('fake_object_user_account')

            post path, params: params

        end
        
        end

end