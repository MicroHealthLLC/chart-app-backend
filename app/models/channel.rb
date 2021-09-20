class Channel < ApplicationRecord
  belongs_to :user
  has_many :reports
  has_many :dashboards
  has_many :data_set_channels
  has_many :data_sets, through: :data_set_channels
end
