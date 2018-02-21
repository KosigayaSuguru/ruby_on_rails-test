class TestController < ApplicationController
    def test
        table1 = Table1.new(col1: 'aaaa', col2: 'bbbb')
        table1.save
        table1 = Table1.where(col1: 'aaaa')
        # puts "#{table1.col1}, #{table1.col2}"
        table1.each do |a|
            puts "#{a.col1}, #{a.col2}"
        end
        @hogehoge = 'インスタンス変数を使って直渡ししてるよ'
        @hogehoge2 = ['1','22','333','4444']
        render :locals => { aaaa: 'localsを使ってテンプレートに値渡してるよ（推奨）' }
    end
end
