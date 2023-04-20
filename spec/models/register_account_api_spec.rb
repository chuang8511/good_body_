require 'rails_helper'

RSpec.describe V1::RegisterAccountApi, type: :request do
  let(:path) {'/v1/register_account'}

  let(:params) {
    -> (account,phone_number,email) {
        { account: account, password: "123", name:"horatio", phone_number: phone_number, height: 170, weight: 60, age: 20, email: email, gender:"male"}
    }
}
  test_account1 = "abcabc123"
  test_account2 = "kk0512"
  valid_test_phone_number1="0912345678"
  valid_test_phone_number2="0987654321"
  invalid_phone_number = "0212345678"
  phone_number_with_wrong_length="09123"
  test_mail1 = "horatio333@mail.com"
  test_mail2 = "RomaInvicta@mail.com"
  invalid_test_mail = "eddie123gmail.com"

  describe "創建帳戶" do

    it "輸入新用戶資料，創建帳戶成功" do
      User.create!(account: "zzz",phone_number: "0973006502",email: "eddie@gmail.com",password: "23")
      total_user_number_expected = User.all.count+1

      post path, params: params[test_account1, valid_test_phone_number1, test_mail1]
      expect(User.all.count).to eq total_user_number_expected
      #p response
      parsed = JSON.parse(response.body)
      expect(parsed["context"]).to eq "創建帳戶成功"
    end

    it "輸入資料有缺，創建帳戶失敗" do
      #沒填帳戶
      post path, params: params["", valid_test_phone_number1, test_mail1]
      parsed = JSON.parse(response.body)
      expect(parsed["context"]).to eq "必填欄位空白"

      #沒填手機
      post path, params: params[test_account1, "", test_mail1]
      parsed = JSON.parse(response.body)
      expect(parsed["context"]).to eq "必填欄位空白"

      #沒填mail
      post path, params: params[test_account1, valid_test_phone_number1, ""]
      parsed = JSON.parse(response.body)
      expect(parsed["context"]).to eq "必填欄位空白"


    end

    it "輸入的郵件已存在，創建帳戶失敗" do
      post path, params: params[test_account1, valid_test_phone_number1, test_mail1]
      post path, params: params[test_account2, valid_test_phone_number2, test_mail1]
      parsed = JSON.parse(response.body)
      expect(parsed["context"]).to eq "郵件已存在"
    end

    it "郵件格式錯誤，創建帳戶失敗" do
      post path, params: params[test_account1, valid_test_phone_number1, invalid_test_mail]
      parsed = JSON.parse(response.body)
      expect(parsed["context"]).to eq "郵件格式錯誤"
    end

    it "帳號已存在，創建帳戶失敗" do
      post path, params: params[test_account1, valid_test_phone_number1, test_mail1]
      post path, params: params[test_account1, valid_test_phone_number2, test_mail2]
      parsed = JSON.parse(response.body)
      expect(parsed["context"]).to eq "帳號已存在"
    end

    it "手機號碼已存在，創建帳戶失敗" do
      post path, params: params[test_account1, valid_test_phone_number1, test_mail1]
      post path, params: params[test_account2, valid_test_phone_number1, test_mail2]
      parsed = JSON.parse(response.body)
      expect(parsed["context"]).to eq "手機號碼已存在"
    end

    it "手機號碼格式錯誤，創建帳戶失敗" do
      #號碼長度不是10
      post path, params: params[test_account2, phone_number_with_wrong_length, test_mail2]
      parsed = JSON.parse(response.body)
      expect(parsed["context"]).to eq "手機號碼格式錯誤"
    end

    it "這不是有效的手機號碼，創建帳戶失敗" do
      #不是以09開頭
      post path, params: params[test_account2, invalid_phone_number, test_mail2]
      parsed = JSON.parse(response.body)
      expect(parsed["context"]).to eq "這不是有效的手機號碼"
    end

  end
end