require 'rails_helper'

RSpec.describe V1::RecordTimeUpdateApi, type: :request do

    let(:path) { '/v1/record_time_update' }
    let(:params) { { id: 1, contents: "Swim", duration: 300, distance: 3.2 } }
    let(:record_time) { instance_double(RecordTimeUpdate, update_time_record: true) }
    


    describe 'call API' do
        
        before do
            allow(RecordTimeUpdate).to receive(:new).and_return(record_time)
        end
        
        it 'will initialize RecordTimeUpdateSpec' do
            expect(RecordTimeUpdate).to receive(:new).once.with(1, "Swim", 300, 3.2)
            put path, params: params
        end


        it 'will get status 200' do
            put path, params: params
            expect(response.status).to eq 200
        
        end
    end
end
