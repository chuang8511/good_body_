require 'rails_helper'

RSpec.describe V1::TestApi, type: :request do
    #下面這是啥
    let(:path) { '/v1/test' }
    let(:params) {
        -> (boolean) {
            { test_id: "1", check_point: boolean }
        }
    }
##不理解測試的邏輯
    describe 'call test API to check response' do
        context "check point is true" do
            it 'will get true-context result' do
                post path, params: params[true]
                parsed = JSON.parse(response.body)
                expect(parsed["test"]).to eq "1"
                expect(parsed["context"]).to eq("It is a true context")
            end
        end


        context "check point is false" do
            it 'will get false-context result' do
                post path, params: params[false]
                parsed = JSON.parse(response.body)
                expect(parsed["test"]).to eq "1"
                expect(parsed["context"]).to eq("It is a false context")
            end
        end
    end
#
    describe 'call test API to confirm DB change' do

        it 'will generate a new test users' do
            
            expect { post path, params: params[false] }.to change { TestUser.all.count }.by 1

        end

    end
end