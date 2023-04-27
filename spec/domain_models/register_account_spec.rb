require 'rails_helper'

RSpec.describe RegisterAccountUser do

  let(:initialize_instance) {
    -> (account,email,phone_number) { User.new(account:account,password:"fake_password",name:"faker",phone_number:phone_number,height:"fake_height",weight:"fake_weight",age:"always 18",email:email,gender: "fake_gender") }
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


  describe "#initialize" do
  
    it 'generate a new LoginUser with attributes' do
      register_user = initialize_instance['fake_account_number',"fake@email","0912345678"]
      expect(register_user.account).to eq('fake_account_number')
      expect(register_user.email).to eq('fake_email')
      expect(register_user.phone_number).to eq('0912345678')
      expect(register_user.age).to eq('always 18')
      expect(register_user).is_a?(RegisterAccountUser)
      User.new(account:test_account1,password:"fake_password",name:"faker",phone_number:valid_test_phone_number1,height:"fake_height",weight:"fake_weight",age:"always 18",email:test_mail1,gender: "fake_gender")
    end

    let(:instance) {
        -> (account,email,phone_number) { initialize_instance[account,email,phone_number] }
      }
    
      let(:create_account) {
        -> (instance) { instance.create_account }
      }

  describe "#create_account" do

        context "operation failed because some required fields are blank" do
    
          it 'got RequiredInfoLeftBlankError ' do
            expect { create_account[instance["",test_mail1,valid_test_phone_number1]] }.to raise_error(RequiredInfoLeftBlankError, /Some required fields are still blank/)
          end
    
        end

        context "operation failed because email is used by other account" do
    
            it 'got EmailDuplicatedError ' do
              expect { create_account[instance[test_account2,test_mail1,valid_test_phone_number2]] }.to raise_error(EmailDuplicatedError, /#{test_mail1} is already used by other account/)
            end
      
          end

        #not finished
  end
end