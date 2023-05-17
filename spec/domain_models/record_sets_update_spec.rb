require 'rails_helper'

RSpec.describe RecordSetsUpdate do

    let(:initialize_instance) {
        -> (id, content, set, rep, weight) { RecordSetsUpdate.new(id, content, set, rep, weight) }
    }

    let(:set_record) { initialize_instance[1, 'fake_content', 1, 1, 1] }

    let(:id_set) { SetsRecord.new(user_id: 1, contents: 'fake_content', sets: 1, reps: 1, weight: 1) }

    before do
        allow(SetsRecord).to receive(:find_by).and_return(id_set)
    end

    describe "#initialize" do

        it 'generate a new RecordSet with attributes' do
            
            expect(set_record.id).to eq(1)
            expect(set_record.content).to eq('fake_content')
            expect(set_record.set).to eq(1)
            expect(set_record.rep).to eq(1)
            expect(set_record.weight).to eq(1)

        end

    end


    describe '#update_set_record' do

        context 'when record is not found' do
            before do
                allow(SetsRecord).to receive(:find_by).and_return(nil)
            end
          
            it 'raises NoIdError' do
                expect { set_record.update_set_record }.to raise_error(NoIdError, /Record ID does not exist./)
            end
        
        end
        
        context 'when content is blank' do
            before do
                set_record.instance_variable_set(:@content, '')
            end
        
            it 'raises NoContentError' do
              expect { set_record.update_set_record }.to raise_error(NoContentError, /The content input is invalid, please modify it./)
            end

        end

        context 'when set is blank or invalid' do

            shared_examples 'invalid set' do |set|
                it "raises NoSetError with #{set} set" do
                  set_record.instance_variable_set(:@set, set)
                  expect { set_record.update_set_record }.to raise_error(NoSetError, /Your input: #{set} is invalid, please modify it./)
                end
            end

            include_examples 'invalid set', ''
            include_examples 'invalid set', 0
            include_examples 'invalid set', -1
            include_examples 'invalid set', 101

        end

        context 'when rep is blank or invalid' do
            
            shared_examples 'invalid rep' do |rep|
                it "raises NoRepError with #{rep} rep" do
                  set_record.instance_variable_set(:@rep, rep)
                  expect { set_record.update_set_record }.to raise_error(NoRepError, /Your input: #{rep} is invalid, please modify it./)
                end
            end

            include_examples 'invalid rep', ''
            include_examples 'invalid rep', 0
            include_examples 'invalid rep', -1
            include_examples 'invalid rep', 101

        end

        context 'when weight is blank or invalid' do
            shared_examples 'invalid weight' do |weight|
                it "raises NoWeightError with #{weight} weight" do
                  set_record.instance_variable_set(:@weight, weight)
                  expect { set_record.update_set_record }.to raise_error(NoWeightError, /Your input: #{weight} is invalid, please modify it./)
                end
            end

            include_examples 'invalid weight', ''
            include_examples 'invalid weight', 0
            include_examples 'invalid weight', -1
            include_examples 'invalid weight', 301

        end

        context 'when all params are same' do
            it 'raises SameParamsError' do
                expect { set_record.update_set_record }.to raise_error(SameParamsError,/Your new update is same as the former one./)
            end
        
        end

        context 'when all input data are valid' do

            it 'updates the set record' do
                expect(RecordSetRepository).to receive(:update_set_record).with(id_set, 'new_content', 10, 20, 30)
                set_record.content = 'new_content'
                set_record.set = 10
                set_record.rep = 20
                set_record.weight = 30
                set_record.update_set_record
            end
            
        end
    end
end




