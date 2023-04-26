require 'rails_helper'

RSpec.describe V1::RecordTimeCreateApi, type: :request do

    let(:path) { '/v1/record_time_create' }

    let(:params) { { user_id: '1', contents: 'Swim', duration: 300} }


    describe 'call API' do
        
        it 'will initialize RecordTimeCreateSpec' do
            expect(RecordTimeCreate).to receive(:new).once.with(1, "Swim", 300)

            post path, params: params
        end

        it 'will get staus 201' do
            post path, params: params
            expect(response.status).to eq 201
        
        end
    end
end
