class V1::ReportsController < ApplicationController
  before_action :set_report, only: [:show, :update, :destroy]
  before_action :report_user?, except: %i[index public personal group new create]

# GET /reports
  def index
    @public_reports = Report.public_reports.latest
    @personal_reports = Report.personal_reports(@current_user).latest
    @group_reports = Report.group_reports.latest.all_accessible(@current_user)

    render json: {
      public: @public_reports,
      personal: @personal_reports,
      group: @group_reports
    }.to_json(include: [:channel, :data_set, :tags])
  end

  # GET /public_reports
  def public
    render json: Report.public_reports.to_json(include: [:channel, :data_set, :tags])
  end
  
  # GET /personal_reports
  def personal
    render json: Report.personal_reports(@current_user).to_json(include: [:channel, :data_set, :tags])
  end

  # GET /group_reports
  def group
    render json: Report.group_reports.all_accessible(@current_user).to_json(include: [:channel, :data_set, :tags])
  end

  # GET /reports/1
  def show
    render json: @report.to_json(include: 
      [
        :channel,
        :data_set,
        :tags, 
        {
          user: {only: [:id, :first_name, :last_name]}
        }
      ]
    )
  end

  # POST /reports
  def create
    @report = Report.new(report_params)
    @report.tag_ids = params[:tag_ids]

    if @report.save
      render json: @report.to_json(include:
        [
          :channel,
          :data_set,
          :tags, 
          { 
            user: {only: [:id, :first_name, :last_name]}
          }
        ]
      ),
      status: :created
    else
      render json: @report.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reports/1
  def update
     @report.tag_ids = params[:tag_ids]

    if @report.update(report_params)
      render json: @report.to_json(include:
        [
          :channel,
          :data_set,
          :tags,
          { 
            user: {only: [:id, :first_name, :last_name]}
          }
        ]
      )
    else
      render json: @report.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reports/1
  def destroy
    @report.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      logger.info e
      render json: { errors: ['Not found'] }, status: :not_found
    end

    # Only allow a list of trusted parameters through.
    def report_params
      params.require(:report).permit(
        :title,
        :description,
        :chart_type,
        :channel_id,
        :data_set_id,
        :color_scheme_id,
        :user_id,
        :last_updated_by,
        tags: []
      )
    end

    def report_user?
      render json: { errors: ['Forbidden access'] }, status: :forbidden unless @report.access?(@current_user)
    end
end
