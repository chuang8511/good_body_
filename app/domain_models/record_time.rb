class RecordTime

    attr_accessor :function, :user, :user_id, :contents, :duration
    
    def initialize(function, account, contents, duration)
        @function = function
        @user     = User.find_by(account: account)
        @user_id  = user&.id
        @contents = contents
        @duration = duration
    end 

    def action
        case function
        when "add"
          create
        when "update"
          update
        when "delete"
          delete
        when "view"
          view
        else
          raise "Invalid function"
        end
    end    
    
    private

    def create
        TimesRecord.create!(user_id: user_id, contents: contents, duration: duration)
        return {msg: "Successfully recorded!"}
    end    

    def update

    end 
    
    def delete

    end
    
    def view

    end

    # def second_formatted(seconds) #把秒轉換為分鐘和小時 #先不做這個
    #     ["#{seconds / 3600}h","#{seconds / 60 % 60}m","#{seconds % 60}s"].select { |str| str =~ /[1-9]/ }.join(" ")
    # end

end


