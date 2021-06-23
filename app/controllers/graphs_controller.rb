class GraphsController < ApplicationController
  # require "date"
  # グラフの表示
  def index
    # d = Date.today
    # date_1 = d - 1
    # date_2 = d - 2
    # date_3 = d - 3
    # date_4 = d - 4
    # date_5 = d - 5
    # date_6 = d - 6
    # date_7 = d - 7

    # date_1_count = current_user.tasks.where(done_date: date_1).count
    # date_2_count = current_user.tasks.where(done_date: date_2).count
    # date_3_count = current_user.tasks.where(done_date: date_3).count
    # date_4_count = current_user.tasks.where(done_date: date_4).count
    # date_5_count = current_user.tasks.where(done_date: date_5).count
    # date_6_count = current_user.tasks.where(done_date: date_6).count
    # date_7_count = current_user.tasks.where(done_date: date_7).count

    # @chart = { date_7 => date_7_count, date_6 => date_6_count, date_5 => date_5_count, date_4 => date_4_count, date_3 => date_3_count, date_2 => date_2_count, date_1 => date_1_count, }

    # 過去1週間に完了したタスク数を日付をkeyにしたHash構造のデータにして、chartkickで使用する。
    # { date => date_count, ... }
    target_day = Date.current.yesterday
    @chart = 7.times.map do |x|
      [target_day - x.day, current_user.tasks.where(done_date: target_day - x.day).count]
    end.reverse.to_h
  end
end