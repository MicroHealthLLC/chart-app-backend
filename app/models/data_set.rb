class DataSet < ApplicationRecord
  belongs_to :user
  has_many :reports
  has_many :data_set_channels
  has_many :channels, through: :data_set_channels
end
