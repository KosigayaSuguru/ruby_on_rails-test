class SearchTestController < ApplicationController

    def index
        logger.debug "object_id: #{self.object_id}"
        logger.debug params.has_key?(:search_test_search_test_form)
        a = params.require(:search_test_search_test_form).permit(:id, :col1, :col2) if params.has_key?(:search_test_search_test_form)
        form = SearchTest::SearchTestForm.new(a)

        unless a.nil?
            # TODO col1,col2 が検索条件に指定された時
            list = Table1.where(id: a[:id])
            logger.debug list.class
        else 
            list = []
        end
        render :locals => { form: form, list: list }
    end
end
