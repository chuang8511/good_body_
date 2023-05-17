require 'rails_helper'

RSpec.describe V1::RecordTimeCreateApi, type: :request do

    let(:path) { '/v1/record_time_create' }
    let(:params) { { user_id: '1', contents: 'Swim', duration: 300, distance: 2.5} }
    let(:record_time) { instance_double(RecordTimeCreate, create_time_record: true) }


    describe 'call API' do
        
        before do
            allow(RecordTimeCreate).to receive(:new).and_return(record_time)
        end
        
        it 'will initialize RecordTimeCreateSpec' do
            expect(RecordTimeCreate).to receive(:new).once.with(1, "Swim", 300, 2.5)
            post path, params: params
        end


        it 'will get status 201' do
            post path, params: params
            expect(response.status).to eq 201
        
        end
    end
end
