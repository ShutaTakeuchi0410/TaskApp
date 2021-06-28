class TaskMailer < ApplicationMailer
  def greeting
    @greeting = "Hi"

    mail to: "takeuchi@hab-co.jp"
  end
end
