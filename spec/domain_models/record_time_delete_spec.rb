require 'rails_helper'

RSpec.describe RecordTimeDelete do

    let(:initialize_instance) {
        -> (id) { RecordTimeDelete.new(id) }
      }

    let(:id) { 1 }
    let(:invalid_id) { "" }
    let(:time_record) { instance_double(TimesRecord) }



    before do
        allow(TimesRecord).to receive(:find_by).and_return(time_record)
    end

    describe "#delete_time_record" do 
        context "when record is blank" do 
                before do
                    allow(time_record).to receive(:blank?).and_return(true)
                end

            it 'raise no record found error' do
                expect{
                    initialize_instance[invalid_id].delete_time_record
                }.to raise_error(NoIdError)
            end
        end

        context "when record exists" do 
            it 'delete the time record' do
                allow(RecordTimeRepository).to receive(:delete).and_return(true)
                result = initialize_instance[id].delete_time_record
                expect(result).to eq(true)
            end
        end
    end
end

 