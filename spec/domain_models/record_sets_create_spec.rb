require 'rails_helper'
# require_relative 'shared_examples.rb'

RSpec.describe RecordSetsCreate do

    let(:initialize_instance) {
        -> (user_id, content, set, rep, weight) { RecordSetsCreate.new(user_id, content, set, rep, weight) }
    }
    let(:set_record) {
        initialize_instance['fake_user_id', 'fake_content', 1, 1, 1]
    }

    describe "#initialize" do

        it 'generate a new RecordSet with attributes' do

            expect(set_record.user_id).to eq('fake_user_id')
            expect(set_record.content).to eq('fake_content')
            expect(set_record.set).to eq(1)
            expect(set_record.rep).to eq(1)
            expect(set_record.weight).to eq(1)
        end
    end


    describe '#create_set_record' do

        context 'when content is blank' do
            before do
                set_record.instance_variable_set(:@content, '')
            end
            
            it 'raises NoContentError' do
                expect { set_record.create_set_record}.to raise_error(NoContentError, /The content input is invalid, please modify it./)
            end
        end

        
        context 'when set is blank or invalid' do

            shared_examples 'invalid set' do |set|
                it "raises NoSetError with #{set} set" do
                  set_record.instance_variable_set(:@set, set)
                  expect { set_record.create_set_record }.to raise_error(NoSetError, /Your input: #{set} is invalid, please modify it./)
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
                  expect { set_record.create_set_record }.to raise_error(NoRepError, /Your input: #{rep} is invalid, please modify it./)
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
                  expect { set_record.create_set_record }.to raise_error(NoWeightError, /Your input: #{weight} is invalid, please modify it./)
                end
            end

            include_examples 'invalid weight', ''
            include_examples 'invalid weight', 0
            include_examples 'invalid weight', -1
            include_examples 'invalid weight', 301

        end

        context 'when all input data are valid' do
            it 'creates a new RecordSet' do
                # expect(set_record.create_set_record).to be true
                # expect {set_record.create_set_record}.to change {RecordSetRepository.all.length}.by(1)
                allow(RecordSetRepository).to receive(:create_set_record).and_return(true)
                result = set_record.create_set_record
                expect(result).to eq(true)
            end
        end
    end
end




