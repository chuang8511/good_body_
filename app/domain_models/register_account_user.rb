class RegisterAccountUser

    attr_reader :account, :password, :name, :email, :phone_number, :age, :gender, :height, :weight
  
    def initialize(account,password,name,email,phone_number,age,gender,height,weight)
      @account=account
      @password=password
      @name=name
      @email=email
      @phone_number=phone_number
      @age=age
      @gender=gender
      @height=height
      @weight=weight
    end

    def create_account()
        required_info_left_blank!
        email_duplicated!(@email)
        email_format_wrong!(@email)
        account_duplicated!(@account)
        phone_number_duplicated!(@phone_number)
        phone_number_format_wrong!(@phone_number)
        phone_number_invalid!(@phone_number)

        #encrypt the password
=begin
        key   = ActiveSupport::KeyGenerator.new("2").generate_key("1",32)
        crypt = ActiveSupport::MessageEncryptor.new(key)
        @password=crypt.encrypt_and_sign(@password)
=end    
        User.create!(account:@account,password:@password,name:@name,phone_number:@phone_number,height:@height,weight:@weight,age:@age,email:@email,gender: @gender)

    end

    def required_info_left_blank!()
        raise RequiredInfoLeftBlankError.new() if @account=="" || @password==""|| @name=="" || @phone_number=="" || @email==""
    end

    def email_duplicated!(email)
        raise EmailDuplicatedError.new(email) if not(User.find_by(email: email).nil?)
    end

    def email_format_wrong!(email)
        raise EmailFormatWrongError.new(email) if not(email.include? "@")
    end

    def account_duplicated!(account)
        raise AccountDuplicatedError.new(account) if not(User.find_by(account: account).nil?)
    end

    def phone_number_duplicated!(phone_number)
        raise PhoneNumberDuplicatedError.new(phone_number) if not(User.find_by(phone_number: phone_number).nil?)
    end

    def phone_number_format_wrong!(phone_number)
        raise PhoneNumberFormatWrongError.new(phone_number) if not(phone_number.length==10)
    end

    def phone_number_invalid!(phone_number)
        raise PhoneNumberInvalidError.new(phone_number) if not(phone_number[0..1]=="09")
    end

end

class RequiredInfoLeftBlankError < StandardError
    def initialize()
      msg = "Some required fields are still blank"
      super(msg)
    end
end

class EmailDuplicatedError < StandardError
    def initialize(email)
      msg = "#{email} is already used by other account"
      super(msg)
    end
end

class EmailFormatWrongError < StandardError
    def initialize(email)
      msg = "#{email} is not in the right format"
      super(msg)
    end
end

class AccountDuplicatedError < StandardError
    def initialize(account)
      msg = "#{account} is already registered"
      super(msg)
    end
end

class PhoneNumberDuplicatedError < StandardError
    def initialize(phone_number)
      msg = "#{phone_number} is already used by other account"
      super(msg)
    end
end

class PhoneNumberFormatWrongError < StandardError
    def initialize(phone_number)
      msg = "#{phone_number} is not in the right format"
      super(msg)
    end
end

class PhoneNumberInvalidError < StandardError
    def initialize(phone_number)
      msg = "#{phone_number} is not a valid phone number"
      super(msg)
    end
end