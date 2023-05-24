require 'rails_helper'

RSpec.describe RecordTimeCreate do

    let(:initialize_instance) {
        -> (user_id, contents, duration, distance) { RecordTimeCreate.new(user_id, contents, duration, distance) }
      }

    let(:user_id) { 1 }
    let(:contents) { "Swimming" }
    let(:invalid_contents) { "" }
    let(:duration) { 300 }
    let(:invalid_duration) { 0 }
    let(:distance) { 2.5 }
    let(:invalid_distance) { -1.5 }

    describe "#initialize" do

        it 'generate a new time record with attributes' do
            time_record = initialize_instance[user_id, contents,duration,distance]
            expect(time_record.user_id).to eq(user_id)
            expect(time_record.contents).to eq(contents)
            expect(time_record.duration).to eq(duration)
            expect(time_record.distance).to eq(distance)
            # expect(time_record.user).to eq(user)
        end

    end 

    describe "#create_time_record" do
    
        context "failed to create due to unvalid content" do
            it 'get no content error' do
                expect {
                    initialize_instance[user_id, invalid_contents, duration, distance].create_time_record
                  }.to raise_error(NoContentError, "The content input is invalid, please modify it.")
            end
        end

        context "failed to create due to unvalid duration" do
            it 'get no duration error' do
                expect{
                    initialize_instance[user_id, contents, invalid_duration, distance].create_time_record
                  }.to raise_error(NoDurationError, "Your input: #{invalid_duration} is invalid, please modify it.")
            end
        end

        context "failed to create due to unvalid distance" do
            it 'get no distance error' do
                expect{
                    initialize_instance[user_id, contents, duration, invalid_distance].create_time_record
                }.to raise_error(NoDistanceError, "Your input: #{invalid_distance} is invalid, please modify it.")
            end
        end

        context "succeed to create a time record" do 
            it 'succeed to create a time record' do
                expect(RecordTimeRepository).to receive(:create).and_return(true)
                result = initialize_instance[user_id, contents, duration, distance].create_time_record
                expect(result).to eq(true)
            end
        end
    end
end