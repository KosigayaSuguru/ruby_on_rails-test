class TestController < ApplicationController
    # /test/test
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

    # 表示 /test/post_test
    def post_test_get
        table1last = Table1.last
        table1new = Table1.new({col1: table1last.col1, col2: table1last.col2})
        table1new.table1_child.new
        table1new.table1_child = table1last.table1_child unless table1last.table1_child.empty?

        # ログ
        logger.debug table1last.table1_child.class
        table1last.table1_child.each do |a| logger.debug "aaaaaaaaaa #{a.inspect}" end

        # ランダムで部分テンプレートの pertial1 or pertial2 を切り替える
        pertial = "test/post_test_get_pertial#{rand(2)+1}"
        logger.debug pertial
        render :locals => { update_record: table1last, new_record: table1new, pertial: pertial }
    end

    # 登録用
    def post_test_post
        logger.debug "ろぐです"
        a = params.require(:table1).permit(:col1, :col2, table1_child_attributes: [:col1])
        b = Table1.new(a)
        b.save
        redirect_to post_test_get_path, :status => 301
    end

    # 更新用
    def post_test_patch
        a = params.require(:table1).permit(:col1, :col2, table1_child_attributes: [:id, :col1])
        b = Table1.last
        # b.col1 = a[:col1]
        # b.col2 = a[:col2]
        # logger.debug "ccccccccc #{a[:table1_child_attributes]["0"].inspect}"
        # logger.debug b.table1_child[0].inspect
        b.update(a)
        redirect_to post_test_get_path, :status => 302
    end
end
