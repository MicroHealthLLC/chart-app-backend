class V1::DataSetsController < ApplicationController
  before_action :set_data_set, only: [:show, :update, :destroy]

  # GET /data_sets
  def index
    @data_sets = DataSet.all

    render json: @data_sets
  end

  # GET /data_sets/1
  def show
    render json: @data_set
  end

  # POST /data_sets
  def create
    @data_set = DataSet.new(data_set_params)

    if @data_set.save
      render json: @data_set, status: :created
    else
      render json: @data_set.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /data_sets/1
  def update
    if @data_set.update(data_set_params)
      render json: @data_set
    else
      render json: @data_set.errors, status: :unprocessable_entity
    end
  end

  # DELETE /data_sets/1
  def destroy
    @data_set.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_data_set
      @data_set = DataSet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def data_set_params
      data_keys = params.require(:data_set).fetch(:data, {}).map(&:keys)
      params.require(:data_set).permit(:title, :description, data: data_keys)
    end
end
