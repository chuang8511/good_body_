require 'rails_helper'

RSpec.describe FollowStatusData do
    User.create!(account: "zzz",phone_number: "0973006502",email: "eddie@gmail.com",password: "23")
    User.create!(account: "zzzzz",phone_number: "0973006503",email: "eddie11@gmail.com",password: "23")
    User.create!(account: "zzzz",phone_number: "0973006504",email: "eddie1@gmail.com",password: "23")
    follow_status_data=FollowStatusData.new()
    
  describe "initialize FollowStatusData with follow_status_record table" do

    it 'check if the test records are properly initialized' do
       FollowStatusRecord.create!(subject_user_id:1,action_type:"follow",object_user_id:2)
       FollowStatusRecord.create!(subject_user_id:2,action_type:"follow",object_user_id:3)
       follow_status_data.update_record_to_latest
       expect(follow_status_data.get_record_number).to eq(2)
    end

    it 'check if current_status and current_following are initialized' do

        expect(follow_status_data.current_status).is_a?(Hash)
        expect(follow_status_data.current_following).is_a?(Hash)
        
    end

    it 'check if current_status is working properly' do
        
        expect(follow_status_data.current_status[1]).to eq([2])
        expect(follow_status_data.current_status[2]).to eq([3])
        
    end

    it 'check if current_following is working properly' do
        expect(follow_status_data.current_following[2]).to eq([1])
        expect(follow_status_data.current_following[3]).to eq([2])

    end
  end

  describe "get and add record using FollowStatusData" do

    it 'check if get_follower() is working properly' do
        expect(follow_status_data.get_follower(2)).to eq([1])
        expect(follow_status_data.get_follower(3)).to eq([2])
    end

    it 'check if get_following() is working properly' do
        expect(follow_status_data.get_following(1)).to eq([2])
        expect(follow_status_data.get_following(2)).to eq([3])
    end
#=begin
    it 'check if add_follow_status_record is working properly' do #這裡的spec有問題 之後再修

        follow_status_data.add_follow_status_record(1,"follow",3)
        expect(follow_status_data.get_following(1)).to eq([2,3])
        follow_status_data.add_follow_status_record(1,"unfollow",3)
        expect(follow_status_data.get_following(1)).to eq([2])

    end
  end
end