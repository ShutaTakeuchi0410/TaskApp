desc "全ユーザーに毎朝９時にタスクのリマインドメールを送信する"
task :send_reminder => :environment do
  TaskMailer.send_mail_users
end