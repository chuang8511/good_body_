require 'rails_helper'
#require_relative 'common_error'

RSpec.describe RecordTimeCreate do

    let(:initialize_instance) {
        -> (user_id, contents, duration, distance) { RecordTimeCreate.new(user_id, contents, duration, distance) }
      }

    let(:user_id) { 1 }
    let(:contents) { "Swimming" }
    let(:duration) { 300 }
    let(:distance) { 2.5 }
    let(:user) { instance_double(User, blank?: false) }


    before do
        allow(User).to receive(:find_by).and_return(user)
    end

    describe "#initialize" do

        it 'generate a new time record with attributes' do
            time_record = initialize_instance['user_id', 'contents','duration','distance']
            expect(time_record.user_id).to eq('user_id')
            expect(time_record.contents).to eq('contents')
            expect(time_record.duration).to eq('duration')
            expect(time_record.distance).to eq('distance')
            expect(time_record.user).to eq(user)
        end

    end 

    describe "#create_time_record" do
        
        context "failed to create due to unmatch user" do
            it 'get no user error' do
                allow(User).to receive(:find_by).and_return(nil)
                expect {
                    initialize_instance[user_id, contents, duration, distance].create_time_record
                  }.to raise_error(NoUseridError, "User does not exist.")                    
            end
        end

        context "failed to create due to unvalid content" do
            it 'get no content error' do
                expect {
                    initialize_instance[user_id, nil, duration, distance].create_time_record
                  }.to raise_error(NoContentError, "The content input is invalid, please modify it.")
              
                  expect {
                    initialize_instance[user_id, "", duration, distance].create_time_record
                  }.to raise_error(NoContentError, "The content input is invalid, please modify it.")

            end
        end

        context "failed to create due to unvalid duration" do
            it 'get no duration error' 
            
        end

        context "failed to create due to unvalid distance" do
            it 'get no distance error' 
            
        end

        context "succeed to create a time record" do 
            it 'succeed to create a time record' 
            
        end

    end

end