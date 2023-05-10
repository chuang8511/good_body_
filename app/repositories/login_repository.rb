class LoginRepository

  class << self

    def save!(login_user)
        LoginRecord.create!(account_number: login_user.account_number,
                            is_login:       login_user.is_login)
    end

  end

end