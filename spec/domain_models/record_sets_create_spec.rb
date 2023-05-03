require 'rails_helper'

RSpec.describe RecordSetsCreate do

    let(:initialize_instance) {
        -> (user_id, content, set, rep, weight) { RecordSetsCreate.new(user_id, content, set, rep, weight) }
    }
        let(:fake_id_data) {  
        SetsRecord.new(
        user_id: 'fake_user_id',
        contents: 'fake_content',
        sets: 'fake_set',
        reps:'fake_reps',
        weight: 'fake_weight'
        ) 
    }
    let(:fake_user) { allow(User).to receive(:find_by).and_return(fake_user_data) }

    describe "#initialize" do

        it 'generate a new RecordSet with attributes' do
            set_record = initialize_instance[
                'fake_user_id',
                'fake_content',
                'fake_set',
                'fake_rep',
                'fake_weight'
            ]
            expect(set_record.user_id).to eq('fake_user_id')
            expect(set_record.content).to eq('fake_content')
            expect(set_record.set).to eq('fake_set')
            expect(set_record.rep).to eq('fake_rep')
            expect(set_record.weight).to eq('fake_weight')
        end
    end

    describe '#create_set_record' do
        context 'when user is not found' do
            it 'raises NoUseridError' do
                expect { initialize_instance.call('fake_user_id', 'fake_content', 'fake_set', 'fake_reps', 'fake_weight').create_set_record }.to raise_error(NoUseridError)
            end
          end

        context 'when content is blank' do
            it 'raises NoContentError' do
                expect { initialize_instance.call('fake_user_id', '', 'fake_set', 'fake_reps', 'fake_weight').create_set_record }.to raise_error(NoContentError)
            end
        end

        context 'when set is blank or invalid' do
            it 'raises NoSetError' do
                record_set_create.set = ''
                expect { record_set_create.create_set_record }.to raise_error(NoSetError)

                record_set_create.set = nil
                expect { record_set_create.create_set_record }.to raise_error(NoSetError)

                record_set_create.set = 0
                expect { record_set_create.create_set_record }.to raise_error(NoSetError)

                record_set_create.set = -1
                expect { record_set_create.create_set_record }.to raise_error(NoSetError)

                record_set_create.set = 101
                expect { record_set_create.create_set_record }.to raise_error(NoSetError)
            end
        end

        context 'when rep is blank or invalid' do
            it 'raises NoRepError' do
                record_set_create.rep = ''
                expect { record_set_create.create_set_record }.to raise_error(NoRepError)

                record_set_create.rep = nil
                expect { record_set_create.create_set_record }.to raise_error(NoRepError)

                record_set_create.rep = 0
                expect { record_set_create.create_set_record }.to raise_error(NoRepError)

                record_set_create.rep = -1
                expect { record_set_create.create_set_record }.to raise_error(NoRepError)

                record_set_create.rep = 101
                expect { record_set_create.create_set_record }.to raise_error(NoRepError)
            end
        end

        context 'when weight is blank or invalid' do
            it 'raises NoWeightError' do
                record_set_create.weight = ''
                expect { record_set_create.create_set_record }.to raise_error(NoWeightError)

                record_set_create.weight = nil
                expect { record_set_create.create_set_record }.to raise_error(NoWeightError)

                record_set_create.weight = 0
                expect { record_set_create.create_set_record }.to raise_error(NoWeightError)

                record_set_create.weight = -1
                expect { record_set_create.create_set_record }.to raise_error(NoWeightError)

                record_set_create.weight = 301
                expect { record_set_create.create_set_record }.to raise_error(NoWeightError)
            end
        end

        context 'when all input data are valid' do
            it 'creates a new RecordSet' do
            expect { record_set_create.create_set_record }.to change { RecordSet.count }.by(1)
            end
        end
    end
end




