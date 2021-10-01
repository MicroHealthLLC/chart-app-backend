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
  scope :personal_reports, ->(user_id) { joins(:channel).where(channels: { category: 1 }, user_id: user_id) }
  scope :latest, -> { order('created_at DESC').limit(6) }

  def access?(user)
    return true if channel.public_channel?

    if channel.personal_channel?
      user_id == user.id
    elsif channel.group_channel?
      channel.member_ids.include?(user.id)
    end
  end

  def self.all_accessible(user)
    select { |r| r.access?(user) }
  end
end
