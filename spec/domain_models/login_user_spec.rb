require 'rails_helper'

RSpec.describe LoginUser do

  let(:initialize_instance) {
    -> (email) { LoginUser.new('fake_uuid', email) }
  }
  let(:fake_user_data) {  User.new(email: 'fake_account_number', password: 'fake_password') }
  let(:fake_user) { allow(User).to receive(:find_by).and_return(fake_user_data) }


  describe "#initialize" do
    before do
      fake_user
    end
    it 'generate a new LoginUser with attributes' do
      login_user = initialize_instance['fake_account_number']
      expect(login_user.uuid).to eq('fake_uuid')
      expect(login_user.account_number).to eq 'fake_account_number'
      expect(login_user.user).is_a?(User)
      expect(login_user.is_login).to eq(false)
    end
  end

  let(:instance) {
    -> (email) { initialize_instance[email] }
  }

  let(:login) {
    -> (instance, password) { instance.login(password) }
  }

  describe "#login" do

    context "failed to login because wrong input of email" do

      it 'got no user error' do
        expect { login[instance['no_email'], 'fake_password'] }.to raise_error(NoUserError, /There is no no_email user/)
      end

    end

    context "failed to login because wrong input of password" do
      before do
        fake_user
      end

      it 'got password is wrong' do
        expect { login[instance['fake_account_number'], 'wrong_password'] }.to raise_error(WrongPasswordError, /Password is wrong/)
      end

    end


    context "succeed to login" do
      before do
        fake_user
      end

      it 'succeed to login' do
        login_user = instance['fake_account_number']
        login[login_user, 'fake_password']
        expect(login_user.is_login).to eq true
      end

    end

  end

end