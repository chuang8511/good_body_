require 'rails_helper'

RSpec.describe V1::RecordTimeApi, type: :request do

    let(:path) { '/v1/record_time' }

    let(:params) { { function: 'add', account: 'isachi', contents: 'Swim', duration: 300} }


    describe 'call API' do
        
        it 'will initialize RecordTimeSpec' do
            expect(RecordTime).to receive(:new).once.with("add", "isachi", "Swim", 300)

            post path, params: params
        end

        it 'will get staus 201' do
            post path, params: params
            expect(response.status).to eq 201
        
        end
    end


end
