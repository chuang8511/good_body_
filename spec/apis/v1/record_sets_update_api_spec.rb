require 'rails_helper'

RSpec.describe V1::RecordSetsUpdateApi, type: :request do

    let(:path) { '/v1/record_sets_update' }
    let(:params) { { id: '1', content: 'push-up', set: 4, rep: 12, weight: 40} }
    let(:record_set) { instance_double(RecordSetsUpdate, update_set_record: true) }


    describe 'call API' do
        
        before do
            allow(RecordSetsUpdate).to receive(:new).and_return(record_set)
        end
        
        it 'will initialize RecordSetUpdateSpec' do
            expect(RecordSetsUpdate).to receive(:new).once.with(1, "push-up", 4, 12,40)
            put path, params: params
        end

        it 'will get status 200' do
            put path, params: params
            expect(response.status).to eq 200
        
        end
    end
end