class Tag < ApplicationRecord
  has_many :report_tags
  has_many :reports, through: :report_tags
  has_many :dashboard_tags
  has_many :dashboards, through: :dashboard_tags
end
