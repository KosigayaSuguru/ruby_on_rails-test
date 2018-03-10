class SearchTestController < ApplicationController
    layout Constants::Layout::MY_LAYOUT

    def index
        logger.debug "object_id: #{self.object_id}"
        logger.debug params.has_key?(:search_test_search_test_form)
        a = params.require(:search_test_search_test_form).permit(:id, :col1, :col2) if params.has_key?(:search_test_search_test_form)
        form = SearchTest::SearchTestForm.new(a)

        unless a.nil?
            # 検索ボタンが押下された場合、指定されている検索条件だけを繋いでいく
            # ※検索条件がない場合、全件取得
            logger.debug "検索ボタン押下"
            list = Table1.all
            list.where!(id: a[:id]) if a[:id].present?
            list.where!(col1: a[:col1]) if a[:col1].present?
            list.where!(col2: a[:col2]) if a[:col2].present?
            # table1_childrenと外部結合
            list.left_outer_joins!(:table1_child)
            list._select!("table1s.*, table1_children.id as cid, table1_children.col1 as ccol1")
            list.order!(:id)
            # TODO table1_childrenがベタ書きになってるのがかなりダサい。。
            list.order!("table1_children.col1 ASC")
            list = list.page(params[:page])
            logger.debug list.class
        else 
            # 検索条件が指定されていない場合、空を返す
            logger.debug "初回表示用"
            list = Table1.none
            logger.debug list.class
        end
        logger.debug "aaaaaaaaa #{list}"
        render :locals => { form: form, list: list }
    end
end
