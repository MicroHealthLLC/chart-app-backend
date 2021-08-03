class Report < ApplicationRecord
  belongs_to :channel
  belongs_to :data_set
end
