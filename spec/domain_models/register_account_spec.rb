require 'rails_helper'

RSpec.describe RegisterAccountUser do

  let(:initialize_instance) {
    -> (account,email,phone_number) { RegisterAccountUser.new(account,"fake_password","faker",email,phone_number,18,"fake_gender",180,80) }
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
  
    it 'generate a new RegisterAccountUser with attributes' do
      register_user = initialize_instance['fake_account_number',"fake@email","0912345678"]
      expect(register_user.account).to eq('fake_account_number')
      expect(register_user.email).to eq('fake@email')
      expect(register_user.phone_number).to eq('0912345678')
      expect(register_user.age).to eq(18)
      expect(register_user).is_a?(RegisterAccountUser)
      
    end

  end
    let(:instance) {
        -> (account,email,phone_number) { initialize_instance[account,email,phone_number] }
      }
    
      let(:create_account) {
        -> (instance) { instance.create_account }
      }

  describe "#create_account" do
    before do
      User.create!(account:test_account1,password:"fake_password",name:"faker",phone_number:valid_test_phone_number1,height:"fake_height",weight:"fake_weight",age:"always 18",email:test_mail1,gender: "fake_gender")
    end
        context "operation failed because some required fields are blank" do
    
          it 'got RequiredInfoLeftBlankError ' do
            expect { create_account[instance["",test_mail1,valid_test_phone_number1]] }.to raise_error(RequiredInfoLeftBlankError, /Some required fields are still blank/)
          end
    
        end

        context "operation failed because email is used by other account" do
    
            it 'got EmailDuplicatedError ' do
              
              p User.find_by(email: test_mail1)
              expect { create_account[instance[test_account2,test_mail1,valid_test_phone_number2]] }.to raise_error(EmailDuplicatedError, /#{test_mail1} is already used by other account/)
            end
      
          end

          context "operation failed because email format is not valid" do
    
            it 'got EmailFormatWrongError ' do
              expect { create_account[instance[test_account2,invalid_test_mail,valid_test_phone_number2]] }.to raise_error(EmailFormatWrongError, /#{invalid_test_mail} is not in the right format/)
            end
      
          end

          context "operation failed because account is already used" do
    
            it 'got AccountDuplicatedError' do
              expect { create_account[instance[test_account1,test_mail2,valid_test_phone_number2]] }.to raise_error(AccountDuplicatedError, /#{test_account1} is already registered/)
            end
      
          end

          context "operation failed because phone number is already used" do
    
            it 'got PhoneNumberDuplicatedError' do
              expect { create_account[instance[test_account2,test_mail2,valid_test_phone_number1]] }.to raise_error(PhoneNumberDuplicatedError, /#{valid_test_phone_number1} is already used by other account/)
            end
      
          end

          context "operation failed because phone number is in a wrong format" do
    
            it 'got PhoneNumberFormatWrongError' do
              expect { create_account[instance[test_account2,test_mail2,phone_number_with_wrong_length]] }.to raise_error(PhoneNumberFormatWrongError, /#{phone_number_with_wrong_length} is not in the right format/)
            end
      
          end

          context "operation failed because phone number is not valid" do
    
            it 'got PhoneNumberInvalidError' do
              expect { create_account[instance[test_account2,test_mail2,invalid_phone_number]] }.to raise_error(PhoneNumberInvalidError, /#{invalid_phone_number} is not a valid phone number/)
            end
      
          end


  end
end