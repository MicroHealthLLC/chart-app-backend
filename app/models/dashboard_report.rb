class DashboardReport < ApplicationRecord
  belongs_to :dashboard
  belongs_to :report
end
