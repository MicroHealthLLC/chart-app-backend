class Channel < ApplicationRecord
  has_many :reports
  has_many :dashboards
end
