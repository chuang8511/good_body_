require 'rails_helper'
RSpec.describe V1::UpdatePersonalProfileApi, type: :request do
    let(:path) {'/v1/update_personal_profile' }

    
    describe 'call u.p.p Api to update the personal profile' do

        it 'account exist' do
            User.create!(account: "1",phone_number: "0973006502",name:"h",email: "eddie@gmail.com",password: "23",weight: 1,height: 1,age: 1,gender: "male")
            post path, params: {account: "1",weight: 60,height: 168,age: 20,gender: "female"}
            parsed = JSON.parse(response.body)
            expect(parsed["height"]).to eq 168
            expect(parsed["weight"]).to eq 60
            expect(parsed["age"]).to eq 20
            expect(parsed["gender"]).to eq "female"

       
        end

        it 'no such account' do
            post path, params: {account: "2",weight: 60,height: 168,age: 20,gender: "female"}
            parsed = JSON.parse(response.body)
           
            expect(parsed["context"]).to eq "帳戶不存在"
        end
    end
end