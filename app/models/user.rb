class User < ApplicationRecord
  include BCrypt
  has_many :channels, dependent: :destroy
  has_many :reports, dependent: :destroy
  has_many :dashboards, dependent: :destroy
  has_many :news, dependent: :destroy
  has_many :data_sets, dependent: :destroy

  has_many :channel_members, dependent: :destroy
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
