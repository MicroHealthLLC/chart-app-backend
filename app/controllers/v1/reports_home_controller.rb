class V1::ReportsHomeController < ApplicationController

  # GET /public
  def public
    @public_reports = Report.public_reports

    render json: {
      public_reports: @public_reports,
      report_count: @public_reports.length,
      channel_count: Channel.count,
      user_count: User.count
    }.to_json
  end

  # GET /personal
  def personal
    @personal_reports = Report.personal_reports(@current_user)

    render json: {
      personal_reports: @personal_reports,
      report_count: @personal_reports.length,
      channel_count: Channel.count,
      user_count: User.count
    }.to_json
  end

  # GET /group
  def group
    @group_reports = Report.group_reports.all_accessible(@current_user)

    render json: {
      group_reports: @group_reports,
      report_count: @group_reports.length,
      channel_count: Channel.count,
      user_count: User.count
    }.to_json
  end
end
