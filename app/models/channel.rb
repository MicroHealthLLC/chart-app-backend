class Channel < ApplicationRecord
  belongs_to :user
  has_many :reports
  has_many :dashboards
  has_many :data_set_channels
  has_many :data_sets, through: :data_set_channels

  enum category: %w[group_channel personal_channel public_channel]

  scope :user_personal_channel, ->(user_id) { personal_channel.where(user_id: user_id) }
end
