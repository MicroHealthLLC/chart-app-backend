class Report < ApplicationRecord
  belongs_to :user
  belongs_to :channel
  belongs_to :data_set
  has_many :dashboard_reports
  # has_many :dashboards, through :dashboard_reports
  has_many :report_tags
  has_many :tags, through: :report_tags

  scope :group_reports, -> { joins(:channel).where(channels: { category: 0 }) }
  scope :public_reports, -> { joins(:channel).where(channels: { category: 2 }) }
  scope :personal_reports, -> { joins(:channel).where(channels: { category: 1 }) }
end
