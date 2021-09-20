class DataSetChannel < ApplicationRecord
  belongs_to :data_set
  belongs_to :channel
end
