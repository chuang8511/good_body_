require 'rails_helper'
RSpec.describe V1::GetPersonalProfileApi, type: :request do
    let(:path) {'/v1/get_personal_profile' }

    
    describe 'call g.p.p Api to take the personal profile' do

        it 'account exist' do
            User.create!(account: "1",phone_number: "0973006502",email: "eddie@gmail.com",password: "23",weight: 1,height: 1,age: 1,gender: "male")
            post path, params: {account: "1"}
            parsed = JSON.parse(response.body)
            expect(parsed["weight"]).to eq 1
            expect(parsed["height"]).to eq 1
            expect(parsed["age"]).to eq 1
            expect(parsed["gender"]).to eq "male"
       
        end

        it 'no such account' do
            post path, params: {account: "039030"}
            parsed = JSON.parse(response.body)
           
            expect(parsed["context"]).to eq "帳戶不存在"
        end
    end
end