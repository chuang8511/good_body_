require 'rails_helper'

RSpec.describe RecordTimeRepository do

let(:time_record) {instance_double(TimesRecord)}
let(:user_id) { 1 }
let(:contents) { "Swimming" }
let(:duration) { 300 }
let(:distance) { 2.5 }

    describe "#change_record" do
        context "create a record" do
            it "will create a record in db" do
                expect{
                    RecordTimeRepository.create(user_id, contents, duration, distance)
                  }.to change { TimesRecord.count }.by(1)
                  time_record = RecordTimeRepository.create(user_id, contents, duration, distance)
                expect(time_record.user_id).to eq(user_id)
                expect(time_record.contents).to eq(contents)
                expect(time_record.duration).to eq(duration)
                expect(time_record.distance).to eq(distance)
            end
        end

        context "delete a record" do
            it "will delete a record in db"
        end

        context "update a record" do
            it "will update a record in db"
        end
    end
end
