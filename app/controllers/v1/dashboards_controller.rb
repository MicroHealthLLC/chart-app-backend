class V1::DashboardsController < ApplicationController
  before_action :set_dashboard, only: [:show, :update, :destroy]

  # GET /dashboards
  def index
    @dashboards = Dashboard.all

    render json: @dashboards.to_json(include: [:channel, {reports: {only: [:title, :chart_type], include: :data_set}}])
  end

  # GET /dashboards/1
  def show
    render json: @dashboard.to_json(include: {reports: {only: [:title, :chart_type], include: :data_set}})
  end

  # POST /dashboards
  def create
    @dashboard = Dashboard.new(dashboard_params)

    if @dashboard.save
      render json: @dashboard, status: :created
    else
      render json: @dashboard.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /dashboards/1
  def update
    if @dashboard.update(dashboard_params)
      render json: @dashboard
    else
      render json: @dashboard.errors, status: :unprocessable_entity
    end
  end

  # DELETE /dashboards/1
  def destroy
    @dashboard.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dashboard
      @dashboard = Dashboard.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def dashboard_params
      params.require(:dashboard).permit(:title, :description, :channel_id, :layout, tags: [], report_ids: [])
    end
end
