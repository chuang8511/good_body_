require 'rails_helper'

RSpec.describe FollowAndUnfollowUser do
    let(:initialize_instance) {
        -> (subject_user_account) { FollowAndUnfollowUser.new(subject_user_account) }
      }

      describe "#initialize" do

        it 'generate a new FollowAndUnfollowUser with attributes' do
          User.create!(account: "111",phone_number: "0973006502",email: "eddie1@gmail.com",password: "23")
          User.create!(account: "222",phone_number: "0973036502",email: "eddie2@gmail.com",password: "23")
          User.create!(account: "333",phone_number: "0973033502",email: "eddie3@gmail.com",password: "23")
          FollowStatusRecord.create!(subject_user_id:1,action_type:"follow",object_user_id:2)
          FollowStatusRecord.create!(subject_user_id:2,action_type:"follow",object_user_id:1)
          follow_user = initialize_instance["111"]
          expect(follow_user.follow_list).is_a?(PersonalFollowListsRepository)
          expect(follow_user.subject_user_id).to eq(1)
        end
      end

      let(:instance) {
        -> (subject_user_account) { initialize_instance[subject_user_account] }
      }
    
      let(:follow) {
        -> (instance, object_user_account) { instance.follow(object_user_account)}
      }

      describe "#follow" do

        context "user follow him/herself" do
    
          it 'got self following error' do
            expect { follow[instance["111"], "111"] }.to raise_error(SelfFollowingError, /You may not follow or unfollow yourself/)
          end
    
        end

        context "user follow someone he/she is already following" do
    
          it 'got already following error' do
            expect { follow[instance["111"], "222"] }.to raise_error(AlreadyFollowingError, /111 is already following 222/)
          end
    
        end
      end

      let(:unfollow) {
        -> (instance, object_user_account) { instance.unfollow(object_user_account)}
      }

      describe "#unfollow" do

        context "user unfollow him/herself" do
    
          it 'got self following error' do
            expect { unfollow[instance["111"], "111"] }.to raise_error(SelfFollowingError, /You may not follow or unfollow yourself/)
          end
    
        end

        context "user unfollow someone he/she is not following" do
    
          it 'got not following error' do
            expect { unfollow[instance["111"], "333"] }.to raise_error(NotFollowingError, /111 is not following 333/)
          end
    
        end
      end

end