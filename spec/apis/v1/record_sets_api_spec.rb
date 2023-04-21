require 'rails_helper'


RSpec.describe V1::RecordSetsApi, type: :request do

    let(:path) { '/v1/login' }

    let(:params) { { functions: 'fake_functions',
        accounts: 'fake_accounts',
        contents: 'fake_contents',
        sets: 'fake_sets',
        reps: 'fake_reps',
        weight: 'fake_weight'} }



    describe 'call API' do

        it 'will initialize a RecordSetsFunctionsSpec' do

            expect(RecordSetsFunctions).to receive(:new).once.with(
                "fake_funtions", 
                "fake_account",
                "fake_contents",
                "fake_sets",
                "fake_reps",
                "fake_weight"
            )
    
            post path, params: params
    
        end
    
        it 'will get status 201' do
            post path, params: params
            expect(response.status).to eq 201
        end
    end
end