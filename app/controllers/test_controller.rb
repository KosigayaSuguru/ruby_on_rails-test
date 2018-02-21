class TestController < ApplicationController
    def test
        @hogehoge = 'インスタンス変数を使って直渡ししてるよ'
        @hogehoge2 = ['1','22','333','4444']
        render :locals => { aaaa: 'localsを使ってテンプレートに値渡してるよ（推奨）' }
    end
end
