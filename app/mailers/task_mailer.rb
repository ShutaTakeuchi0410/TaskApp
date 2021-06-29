class TaskMailer < ApplicationMailer

  # def send_mail
  #   users = User.all
  #   users.each do |user|
  #     # メールを送信するメソッド
  #   end

  #   mail to: "takeuchi@hab-co.jp"
  # end



  # def send_mail
  #   @users = User.all
  #   @users.each do |user|
  #     TaskMailer.set_address(user).deliver_now
  #   end 
  # end

  # def set_address(user)
  #   mail(subject: '本日のタスク',to: user.email, from: "taskapp_info@taskapp.com")
  # end
  

  # def test
  #   # 締め切りを過ぎたタスクと今日のタスクを取得
  #   # 今日のタスク
  #   @today_tasks = current_user.tasks.where("deadline = ?", get_today_date).where(status: false)

  #   # 締め切りを過ぎたタスク
  #   @expired_tasks = current_user.tasks.where("deadline < ?", get_today_date).where(status: false)
  # end

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