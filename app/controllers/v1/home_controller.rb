class V1::HomeController < ApplicationController

  # GET /home
  def index
    @public_reports = Report.public_reports.latest
    @personal_reports = Report.personal_reports(@current_user).latest
    @group_reports = Report.group_reports.latest.all_accessible(@current_user)
    @news = @current_user.news.latest(3)

    render json: {
      reports: {
        public: @public_reports,
        personal: @personal_reports,
        group: @group_reports
      },
      news: @news,
      report_count: @public_reports.length + @personal_reports.length + @group_reports.length,
      dashboard_count: Dashboard.count,
      channel_count: Channel.count,
      user_count: User.count
    }.to_json
  end
end
