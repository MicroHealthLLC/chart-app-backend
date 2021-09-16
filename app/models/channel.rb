class Channel < ApplicationRecord
  belongs_to :user
  has_many :reports
  has_many :dashboards
end
