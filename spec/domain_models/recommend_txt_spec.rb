require 'rails_helper'

RSpec.describe V1::RecommendTxt, type: :request do
        
  describe "Find the txt recommd." do

    recommd_txt = RecommendTxt.new()

    it 'initialization' do  
        User.create!(email:"o1o@ooo.com", password:"account1", account:"accoun1t", phone_number:"0912343678", name:"1", age:"4", height:"9", weight:"9", gender:"female")
        User.create!(email:"o2o@ooo.com", password:"accoun2t", account:"acc1ount", phone_number:"0912342678", name:"2", age:"4", height:"9", weight:"9", gender:"male")
        User.create!(email:"o3o@ooo.com", password:"account3", account:"accou2nt", phone_number:"0912345678", name:"3", age:"4", height:"9", weight:"9", gender:"female")
        SetsRecords.create!(user_id: 1, contents: "yoga", sets: "3", reps: "1", weight: "1")
        SetsRecords.create!(user_id: 2, contents: "yoga", sets: "4", reps: "1", weight: "1")
        SetsRecords.create!(user_id: 3, contents: "yoga", sets: "5", reps: "1", weight: "1")
        TimesRecords.create!(user_id: 2, contents: "running", duration: "5")
        TimesRecords.create!(user_id: 3, contents: "running", duration: "5")
        FollowStatusRecord.create!(subject_user_id:1,action_type:"follow",object_user_id:2)
        FollowStatusRecord.create!(subject_user_id:1,action_type:"follow",object_user_id:3)
        FollowStatusRecord.create!(subject_user_id:2,action_type:"follow",object_user_id:1)
        expect(1).to eq(1)
    end

    recommd_txt = RecommendTxt.new()

    it 'check if the return type() = arr.' do      
        expect(recommd_txt.find_txt_recommend(1)).is_a?(Array)
    end

    it 'check if the numbers of return are fittable' do
        expect(recommd_txt.find_txt_recommend(1).count).to eq(3)
        expect(recommd_txt.find_txt_recommend(2).count).to eq(1)
        expect(recommd_txt.find_txt_recommend(3).count).to eq(0)
    end

  end

end