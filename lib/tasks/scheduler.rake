desc "全ユーザーに毎朝９時にタスクのリマインドメールを送信する"
task :send_reminder => :environment do
  TaskMailer.send_mail_users
end

desc "完了したタスクのうち、1ヶ月以上前のタスクは全て削除する"
task :clean_old_tasks => :environment do
  tasks = Task.where(status: true).where("done_date < ?", 1.month.ago.to_date)
  tasks.destroy_all
end