module SearchTest
    class SearchTestForm
        include ActiveModel::Model
        attr_accessor :id, :col1, :col2

        def hello
            "SearchTest::SearchTestForm#hello"
        end
    end
end
