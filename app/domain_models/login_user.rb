class LoginUser

  attr_reader :uuid, :account_number, :user, :is_login

  def initialize(uuid, account_number)
    @uuid           = uuid
    @account_number = account_number
    @user           = User.find_by(email: account_number)
    @is_login       = false
  end

  def login(password)
    no_user_found!
    password_is_wrong!(password)
    succeed_to_login
  end

  private

  def no_user_found!
    raise NoUserError.new(account_number) if user.blank?
  end

  def password_is_wrong!(password)
    raise WrongPasswordError.new if user.password != password #I do not consider the security here. Please think about how to make it better.
  end

  def succeed_to_login
    @is_login = true
  end

end

# todo: It would be better to arrange in another place.
class NoUserError < StandardError
  def initialize(account_number)
    msg = "There is no #{account_number} user"
    super(msg)
  end
end

class WrongPasswordError < StandardError
  def initialize
    msg = "Password is wrong"
    super(msg)
  end
end