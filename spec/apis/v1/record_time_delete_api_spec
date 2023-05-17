require 'rails_helper'

RSpec.describe V1::RecordTimeDeleteApi, type: :request do

    let(:path) { '/v1/record_time_delete' }
    let(:params) { { id: '1'} }
    let(:record_time) { instance_double(RecordTimeDelete, delete_time_record: true) }

    describe 'call API' do
        
        before do
            allow(RecordTimeDelete).to receive(:new).and_return(record_time)
        end
        
        it 'will initialize RecordTimeDeleteSpec' do
            expect(RecordTimeDelete).to receive(:new).once.with(1)
            delete path, params: params
        end


        it 'will get status 200' do
            delete path, params: params
            expect(response.status).to eq 200
        
        end
    end
end
