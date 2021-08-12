class Report < ApplicationRecord
  belongs_to :channel
  belongs_to :data_set
  has_many :dashboard_reports
  # has_many :dashboards, through :dashboard_reports 
end
