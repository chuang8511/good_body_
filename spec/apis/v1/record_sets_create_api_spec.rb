require 'rails_helper'

RSpec.describe V1::RecordSetsCreateApi, type: :request do

    let(:path) { '/v1/record_sets_create' }
    let(:params) { { user_id: '1', content: 'push-up', set: 4, rep: 12, weight: 40} }
    let(:record_set) { instance_double(RecordSetsCreate, create_set_record: true) }


    describe 'call API' do
        
        before do
            allow(RecordSetsCreate).to receive(:new).and_return(record_set)
        end
        
        it 'will initialize RecordSetCreateSpec' do
            expect(RecordSetsCreate).to receive(:new).once.with(1, "push-up", 4, 12,40)
            post path, params: params
        end

        it 'will get status 201' do
            post path, params: params
            expect(response.status).to eq 201
        
        end
    end
end