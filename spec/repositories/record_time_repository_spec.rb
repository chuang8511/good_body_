require 'rails_helper'

RSpec.describe RecordTimeRepository do

let(:user_id) { 1 }
let(:contents) { "Swimming" }
let(:duration) { 300 }
let(:distance) { 2.5 }
let(:time_record) {RecordTimeRepository.create(user_id, contents, duration, distance)}


    describe "#change_record" do
        context "create a record" do
            it "will create a record in db" do
                expect{
                    RecordTimeRepository.create(user_id, contents, duration, distance)
                  }.to change { TimesRecord.count }.by(1)
                expect(time_record.user_id).to eq(user_id)
                expect(time_record.contents).to eq(contents)
                expect(time_record.duration).to eq(duration)
                expect(time_record.distance).to eq(distance)
            end
        end

        context "delete a record" do
            before do 
                time_record
            end
            it "will delete a record in db" do
                expect{
                    RecordTimeRepository.delete(time_record)
                }.to change { TimesRecord.count }.by(-1)
            end

        end

        context "update a record" do
            it "will update a record in db" do
                new_contents = "Running"
                new_duration = 600
                new_distance = 5.0

                RecordTimeRepository.update(time_record, new_contents, new_duration, new_distance)
                expect(time_record.contents).to eq(new_contents)
                expect(time_record.duration).to eq(new_duration)
                expect(time_record.distance).to eq(new_distance)
            end
        end
    end
end

