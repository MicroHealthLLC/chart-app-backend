class V1::ReportsController < ApplicationController
  before_action :set_report, only: [:show, :update, :destroy]

  # GET /reports
  def index
    @reports = Report.all

    render json: @reports.to_json(include: [:channel, :data_set, :tags])
  end

  # GET /reports/1
  def show
    render json: @report.to_json(include: [:channel, :data_set, :tags])
  end

  # POST /reports
  def create
    @report = Report.new(report_params)
    @report.tag_ids = params[:tag_ids]

    if @report.save
      render json: @report.to_json(include: :tags), status: :created
    else
      render json: @report.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reports/1
  def update
     @report.tag_ids = params[:tag_ids]

    if @report.update(report_params)
      render json: @report.to_json(include: :tags)
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
    end

    # Only allow a list of trusted parameters through.
    def report_params
      params.require(:report).permit(:title, :description, :chart_type, :channel_id, :data_set_id, tags: [])
    end
end
