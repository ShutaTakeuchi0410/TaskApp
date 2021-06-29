class TaskMailer < ApplicationMailer
  def send_mail(user)
    @user = user

    @today_tasks = @user.tasks.where("deadline = ?", get_today_date).where(status: false).order(priority: "ASC")
    @expired_tasks = @user.tasks.where("deadline < ?", get_today_date).where(status: false)
    
    mail(subject: '本日のタスク一覧連絡',to: user.email, from: "taskapp_info@taskapp.com")
  end 
  
  def self.send_mail_users
    @users = User.all
    @users.each do |user|
      TaskMailer.send_mail(user).deliver_now
    end 
  end

  private

  # 本日の日付を取得
  def get_today_date
    today = Date.current.strftime('%Y/%m/%d')
  end
end