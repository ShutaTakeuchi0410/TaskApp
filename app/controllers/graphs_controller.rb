class GraphsController < ApplicationController
  require "date"
  # グラフの表示
  def index
    # @chart = { "2020-01-01" => 100, "2020-01-02" => 80, "2020-01-03" => 110, "2020-01-04" => 130, "2020-01-05" => 90 }
    d = Date.today
    date_1 = d - 1
    date_2 = d - 2
    date_3 = d - 3
    date_4 = d - 4
    date_5 = d - 5
    date_6 = d - 6
    date_7 = d - 7

    puts '************************'
    puts date_1.class
    puts '************************'
  end
end
