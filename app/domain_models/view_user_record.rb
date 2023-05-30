require_relative 'common_error'

class ViewUserRecord

  attr_reader :user_account,:user_id,:records

  def initialize(user_account)
    no_user_found!(user_account)
    @user_account=user_account
    @user_id=User.find_by(account:user_account).id
  end

  def view
    records=[]
    SetsRecord.where(user_id:user_id).each do |record|
        records.append( [
            record.created_at,
            record.user_id, 
            record.contents, 
            record.sets, 
            record.reps, 
            record.weight
            ] )
    end

    TimesRecord.where(user_id:user_id).each do |record|
        records.append( [
            record.created_at,
            record.user_id, 
            record.contents, 
            record.duration, 
            record.distance,
            ])
    end
    
    
    return records
    
  end

  private

  def no_user_found!(user_account)
    raise NoUserError.new(user_account) if User.find_by(account:user_account).blank?
  end
 

end
