require 'rails_helper'

RSpec.describe V1::RegisterAccountApi, type: :request do
  let(:path) { '/v1/create_account' }
  
  describe "創建帳戶" do
    it "輸入新用戶資料，創建帳戶"
    user=User.new
    ##"abc","123","horatio","0933333333",170,60,20
    user.save
    expect(user.error.any?).to be false 
    it "輸入資料有缺”，創建帳戶失敗"
    it "輸入重複資料，創建帳戶失敗"

  end
end
