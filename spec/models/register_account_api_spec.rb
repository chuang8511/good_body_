require 'rails_helper'

RSpec.describe V1::RegisterAccountApi, type: :request do
  let(:path) { '/v1/register_account' }


  describe "創建帳戶" do
    it "輸入新用戶資料，創建帳戶成功" do
      post path, params: {account: "abcabc1a232",
        password: "222",
        name: "Horatio",
        phone_number: "0912345678",
        height: 170,
        weight: 123,
        age: 20,
        mail: "horatio1332@mail.com"}
      #params[true]
      parsed = JSON.parse(response.body)
      expect(parsed["context"]).to eq "創建帳戶成功"
    end

    it "輸入資料有缺，創建帳戶失敗" do
      post path, params: {account: "abcabc1a232",
        password: "",
        name: "Horatio",
        phone_number: "0912345678",
        height: 170,
        weight: 123,
        age: 20,
        mail: "horatio1332@mail.com"}
      parsed = JSON.parse(response.body)
      expect(parsed["context"]).to eq "必填欄位空白"
    end

    it "輸入的郵件已存在，創建帳戶失敗" do
      User.create!(account: "abcabc1a123",
        password: "123",
        name: "Horatio",
        phone_number: "0912343256",
        height: 470,
        weight: 111,
        age: 30,
        mail: "horatio1332@mail.com")
      post path, params: {account: "abcabc1a232",
        password: "123",
        name: "Horatio",
        phone_number: "0912345678",
        height: 170,
        weight: 123,
        age: 20,
        mail: "horatio1332@mail.com"}
      parsed = JSON.parse(response.body)
      expect(parsed["context"]).to eq "郵件已存在"
    end
=begin
                '郵件已存在'
                '帳號已存在'
                '手機號碼已存在'
                '手機號碼格式錯誤'
                '這不是有效的手機號碼'
=end
                
  end
end