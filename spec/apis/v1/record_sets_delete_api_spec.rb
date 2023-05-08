require 'rails_helper'

RSpec.describe V1::RecordSetsDeleteApi, type: :request do

    let(:path) { '/v1/record_sets_delete' }
    let(:params) { { id: '1'} }
    let(:record_set) { instance_double(RecordSetsDelete, delete_set_record: true) }


    describe 'call API' do
        
        before do
            allow(RecordSetsDelete).to receive(:new).and_return(record_set)
        end
        
        it 'will initialize RecordSetDeleteSpec' do
            expect(RecordSetsDelete).to receive(:new).once.with(1) # 預期某個東西 (class) 會進行一次某個行為（method）
            delete path, params: params # HTTP method + id: 1
        end

        it 'will get status 200' do
            delete path, params: params
            expect(response.status).to eq 200
        
        end
    end
end