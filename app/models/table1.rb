class Table1 < ApplicationRecord
    has_many :table1_child
    accepts_nested_attributes_for :table1_child
end
