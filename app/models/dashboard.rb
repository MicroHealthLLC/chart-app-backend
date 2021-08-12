class Dashboard < ApplicationRecord
  belongs_to :channel
  has_many :dashboard_reports
  has_many :reports, -> {order(id: :desc)}, through: :dashboard_reports
end
