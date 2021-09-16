class Dashboard < ApplicationRecord
  belongs_to :user
  belongs_to :channel
  has_many :dashboard_reports
  has_many :reports, -> {order(dashboard_reports: :asc)}, through: :dashboard_reports
  has_many :dashboard_tags
  has_many :tags, through: :dashboard_tags
end
