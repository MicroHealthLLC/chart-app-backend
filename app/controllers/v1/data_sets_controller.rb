class V1::DataSetsController < ApplicationController
  before_action :set_data_set, only: [:show, :update, :destroy]

  # GET /data_sets
  def index
    if params[:channel_id]
      @data_sets = Channel.find(params[:channel_id]).data_sets
    else
      @data_sets = DataSet.all
    end

    render json: @data_sets
  end

  # GET /data_sets/1
  def show
    render json: @data_set.to_json(include:
      [
        :channels,
        user: {
          only: [:first_name, :last_name]
        }
      ]
    )
  end

  # POST /data_sets
  def create
    @data_set = DataSet.new(data_set_params)
    @data_set.channel_ids = params[:channel_ids]

    if @data_set.save
      render json: @data_set.to_json(include:
        [
          :channels,
          user: {
            only: [:first_name, :last_name]
          }
        ]
      ), status: :created
    else
      render json: @data_set.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /data_sets/1
  def update
    @data_set.channel_ids = params[:channel_ids]

    if @data_set.update(data_set_params)
      render json: @data_set.to_json(include:
        [
          :channels,
          user: {
            only: [:first_name, :last_name]
          }
        ]
      )
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
      params.require(:data_set).permit(:title, :description, :user_id, data: data_keys, channels: [])
    end
end
