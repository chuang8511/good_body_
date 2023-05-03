require 'rails_helper'

RSpec.describe InfoIdentification do
    
  describe "#update" do


    context "sucessfully update" do

      it 'good input' do
        infoident = InfoIdentification.new()
        expect( infoident.height_testify(135) ).to eq(135)
        expect( infoident.weight_testify(135) ).to eq(135)
        expect( infoident.age_testify(23) ).to eq(23)
      end
    
    end

    context "failed to update because wrong input" do


      it 'age error' do
        infoident = InfoIdentification.new()
        expect { infoident.age_testify(1) }.to raise_error(WrongAge, /wrong age/)
        expect { infoident.age_testify(200) }.to raise_error(WrongAge, /wrong age/)
      end

      it 'weight error' do
        infoident = InfoIdentification.new()
        expect { infoident.weight_testify(9) }.to raise_error(WrongWeight, /wrong weight/)
        expect { infoident.weight_testify(700) }.to raise_error(WrongWeight, /wrong weight/)
      end

      it 'height error' do
        infoident = InfoIdentification.new()
        expect { infoident.height_testify(9) }.to raise_error(WrongHeight, /wrong height/)
        expect { infoident.height_testify(700) }.to raise_error(WrongHeight, /wrong height/)
      end

    end


end
end