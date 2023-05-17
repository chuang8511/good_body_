require 'rails_helper'

RSpec.describe RecordSetsDelete do

    let(:initialize_instance) { ->(id) { RecordSetsDelete.new(id) } }
    let(:set_record) { initialize_instance['fake_user_id'] }
    let(:sets_record) { double('SetsRecord', id: 'fake_id', content: 'fake_content') }

    before do
        allow(SetsRecord).to receive(:find_by).and_return(sets_record)
    end

    describe '#initialize' do

        it 'generates a new RecordSet with attributes' do
        expect(set_record.id).to eq('fake_user_id')
        expect(set_record.id_set).to eq(sets_record)
        end

    end

    describe '#delete_set_record' do

        context 'when record is blank' do

            before do
            allow(sets_record).to receive(:blank?).and_return(true)
            end
        
            it 'raises NoIdError' do
            expect { set_record.delete_set_record }.to raise_error(NoIdError, /Record ID does not exist./)
            end

        end

        context 'when record exists' do

            it 'deletes a RecordSet' do
            allow(RecordSetRepository).to receive(:delete_set_record).and_return(true)
            result = set_record.delete_set_record
            expect(result).to eq(true)
            end

        end
    end
end
