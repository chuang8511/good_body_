require 'rails_helper'

RSpec.describe RecordTimeUpdate do

    let(:initialize_instance) {
        -> (id, contents, duration, distance) { RecordTimeUpdate.new(id, contents, duration, distance) }
      }

    let(:id) { 1 }
    let(:invalid_id) { "" }
    let(:contents) { "Swimming" }
    let(:invalid_contents) { "" }
    let(:duration) { 300 }
    let(:invalid_duration) { 0 }
    let(:distance) { 2.5 }
    let(:invalid_distance) { -1.5 }
    let(:time_record) { instance_double(TimesRecord) }

    before do
        allow(TimesRecord).to receive(:find_by).and_return(time_record)
    end

    describe "#initialize" do
        it 'generate a update instance with attributes' do
            update_instance = initialize_instance[id, contents, duration, distance]
            expect(update_instance.id).to eq(id)
            expect(update_instance.contents).to eq(contents)
            expect(update_instance.duration).to eq(duration)
            expect(update_instance.distance).to eq(distance)
        end
    end

    describe "#update_time_record" do
        context "when record is blank" do
            before do
                allow(time_record).to receive(:blank?).and_return(true)
            end

            it 'raise no record found error' do
                expect{
                    initialize_instance[invalid_id, contents, duration, distance].update_time_record
                }.to raise_error(NoIdError, /Record ID does not exist./)
            end
        end

        context "when content is invlaid" do
            it 'raise no content error' do
                expect{
                    initialize_instance[id, invalid_contents, duration, distance].update_time_record
                }.to raise_error(NoContentError, /The content input is invalid, please modify it./)
            end
        end

        context "when duration is not valid" do 
            it 'raise no duration error' do 
                expect{
                    initialize_instance[id, contents, invalid_duration, distance].update_time_record
                }.to raise_error(NoDurationError, /Your input: #{invalid_duration} is invalid, please modify it./)
            end
        end

        context "when distance is not valid" do
            it 'raise no distance error' do
                expect{
                    initialize_instance[id, contents, duration, invalid_distance].update_time_record
                }.to raise_error(NoDistanceError, /Your input: #{invalid_distance} is invalid, please modify it./)
            end
        end

        before do
            allow(time_record).to receive(:contents).and_return( "Swimming" )
            allow(time_record).to receive(:duration).and_return( 300 )
            allow(time_record).to receive(:distance).and_return( 2.5 )
        end

        context "when the content is the same" do
            it 'raise same params error' do
                expect{
                    initialize_instance[id, time_record.contents, time_record.duration, time_record.distance].update_time_record
                }.to raise_error(SameParamsError, /Your new update is same as the former one./)
            end
        end

        before do
            allow(time_record).to receive(:contents).and_return( "Run" )
        end

        context "succeed to update a record" do
            it 'update the record' do 
                expect(RecordTimeRepository).to receive(:update).and_return(true)
                result = initialize_instance[time_record, contents, duration, distance].update_time_record
                expect(result).to eq(true)
            end
        end
    end
end

 