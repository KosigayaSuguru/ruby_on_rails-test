class SearchTestController < ApplicationController

    def index
        logger.debug "object_id: #{self.object_id}"
        logger.debug params.has_key?(:search_test_search_test_form)
        a = params.require(:search_test_search_test_form).permit(:id, :col1, :col2) if params.has_key?(:search_test_search_test_form)
        form = SearchTest::SearchTestForm.new(a)

        # パラメータがnilじゃない時(unless a.nil?)に、配列に変換(b.values)して、
        # 配列が全部、空（空文字列、nil）だった場合に検索条件が指定されていない方のルートへ行く
        # TODO ※この辺のロジック、Formクラスに実装した方がいいけど、めんどくさいので一旦このままで放置。。
        logger.debug "a.class: #{a.class}"
        b = []
        b = a.values unless a.nil?

        logger.debug "a.inspect: #{a.inspect}"
        logger.debug "b.inspect: #{b.inspect}"
        c = b.none? do |item| 
            logger.debug "item.inspect: #{item.inspect}"
            item.present?
        end
        logger.debug "c: #{c}"
            
        unless c
            # 検索条件が指定されている場合、指定されている検索条件だけを繋いでいく
            logger.debug "検索条件指定有り"
            list = Table1.all
            list.where!(id: a[:id]) if a[:id].present?
            list.where!(col1: a[:col1]) if a[:col1].present?
            list.where!(col2: a[:col2]) if a[:col2].present?
            logger.debug list.class
        else 
            # 検索条件が指定されていない場合、空を返す
            logger.debug "検索条件指定無し"
            list = Table1.none
            logger.debug list.class
        end
        render :locals => { form: form, list: list }
    end
end
