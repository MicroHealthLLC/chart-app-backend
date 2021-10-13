class Channel < ApplicationRecord
  belongs_to :user
  has_many :reports
  has_many :dashboards
  has_many :data_set_channels
  has_many :data_sets, through: :data_set_channels

  has_many :channel_members, dependent: :destroy
  has_many :members, through: :channel_members, source: :user

  enum category: %w[group_channel personal_channel public_channel]

  scope :user_personal_channel, ->(user_id) { personal_channel.where(user_id: user_id) }
  scope :member_group_channel, ->(user_id) { group_channel.includes(:channel_members).where(channel_members: { user_id: user_id }) }

  def access?(user)
    return true if public_channel?

    if personal_channel?
      user_id == user.id
    elsif group_channel?
      member_ids.include?(user.id)
    end
  end
end
