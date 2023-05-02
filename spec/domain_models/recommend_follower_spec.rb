require 'rails_helper'

RSpec.describe V1::RecommendFollow, type: :request do
        
  describe "Find the Follower recommd." do

    recommd_txt = RecommendFollow.new()

    before do
        User.create!(email:"o1o@ooo.com", password:"account1", account:"accoun1t", phone_number:"0912343678", name:"1", age:"4", height:"9", weight:"9", gender:"female")
        User.create!(email:"o2o@ooo.com", password:"accoun2t", account:"acc1ount", phone_number:"0912342678", name:"2", age:"4", height:"9", weight:"9", gender:"male")
        User.create!(email:"o3o@ooo.com", password:"account3", account:"accou2nt", phone_number:"0912345678", name:"3", age:"4", height:"9", weight:"9", gender:"female")
        User.create!(email:"o4o@ooo.com", password:"account4", account:"accou4nt", phone_number:"0912344678", name:"3", age:"4", height:"9", weight:"9", gender:"female")
        User.create!(email:"o5o@ooo.com", password:"account5", account:"accou5nt", phone_number:"0912545678", name:"3", age:"4", height:"9", weight:"9", gender:"female")
        FollowStatusRecord.create!(subject_user_id:1,action_type:"follow",object_user_id:2)
        FollowStatusRecord.create!(subject_user_id:1,action_type:"follow",object_user_id:3)
        FollowStatusRecord.create!(subject_user_id:2,action_type:"follow",object_user_id:1)
        
    end

    recommd_txt = RecommendFollow.new()

    it 'check if the return type() = arr' do      
        expect(recommd_txt).is_a?(RecommendFollow)
        expect(recommd_txt.recomd(1,[2])).is_a?(Array)
    end

    it 'check if the numbers of return are fittable' do
        expect(recommd_txt.recomd(1,[2]).length).to eq(1)
        expect(recommd_txt.recomd(1,[2,3]).length).to eq(2)

    end

  end

end