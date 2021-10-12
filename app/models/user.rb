class User < ApplicationRecord
  include BCrypt
  has_many :channels
  has_many :reports
  has_many :dashboards
  has_many :news
  has_many :data_sets

  has_many :channel_members
  has_many :channels, through: :channel_members

  validates_uniqueness_of :email

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def valid_password?(pwd)
    self.password == pwd
  end
end
