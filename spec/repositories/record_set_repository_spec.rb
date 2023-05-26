require 'rails_helper'

RSpec.describe RecordSetRepository do

let(:user_id) { 1 }
let(:contents) { "Push-up" }
let(:sets) { 3 }
let(:reps) { 4 }
let(:weight) { 40 }
let(:set_record) {RecordSetRepository.create_set_record(user_id, contents, sets, reps, weight)}


    describe "#change_record" do
        context "create a record" do
            it "will create a record in db" do
                expect{
                    RecordSetRepository.create_set_record(user_id, contents, sets, reps, weight)
                  }.to change { SetsRecord.count }.by(1)
                expect(set_record.user_id).to eq(user_id)
                expect(set_record.contents).to eq(contents)
                expect(set_record.sets).to eq(sets)
                expect(set_record.reps).to eq(reps)
                expect(set_record.weight).to eq(weight)
            end
        end

        context "update a record" do
            it "will update a record in db" do
                new_contents = "Strech"
                new_set = 5
                new_rep = 5
                new_weight = 50

                RecordSetRepository.update_set_record(set_record, new_contents, new_set, new_rep, new_weight)
                expect(set_record.contents).to eq(new_contents)
                expect(set_record.sets).to eq(new_set)
                expect(set_record.reps).to eq(new_rep)
                expect(set_record.weight).to eq(new_weight)

            end
        end

        context "delete a record" do
            before do 
                set_record
            end
            it "will delete a record in db" do
                expect{
                    RecordSetRepository.delete_set_record(set_record)
                }.to change { SetsRecord.count }.by(-1)
            end

        end

    end
end