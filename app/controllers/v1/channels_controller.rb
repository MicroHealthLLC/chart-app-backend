class V1::ChannelsController < ApplicationController
  before_action :set_channel, only: [:show, :update, :destroy]
  before_action :channel_user?, except: %i[index new create]

  # GET /channels
  def index
    render json: {
      public: Channel.public_channel.order(title: :ASC),
      personal: Channel.user_personal_channel(@current_user.id).order(title: :ASC),
      group: Channel.member_group_channel(@current_user.id).order(title: :ASC)
    }.to_json(include: :dashboards)
  end

  # GET /channels/1
  def show
    render json: @channel.to_json(include: 
      [
        members: {only: [:id, :first_name, :last_name]},
        reports: {
          include: [
            :data_set, 
            :tags,
            :channel => {
              :only => [:id, :title]
            }
          ]
        },
        dashboards: {
          include: [:channel, :reports]
        },
        user: {only: [:id, :first_name, :last_name]}
      ]
    )
  end

  # POST /channels
  def create
    @channel = Channel.new(channel_params)
    @channel.member_ids = params[:member_ids]

    if @channel.save
      render json: @channel, status: :created
    else
      render json: @channel.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /channels/1
  def update
    @channel.member_ids = params[:member_ids]

    if @channel.update(channel_params)
      render json: @channel.to_json(include: 
        [
          members: {only: [:id, :first_name, :last_name]},
          reports: {
            include: [
              :data_set, 
              :tags,
              :channel => {
                :only => [:id, :title]
              }
            ]
          },
          dashboards: {
            include: [:channel, :reports]   
          },
          user: {only: [:id, :first_name, :last_name]}
        ]
      )
    else
      render json: @channel.errors, status: :unprocessable_entity
    end
  end

  # DELETE /channels/1
  def destroy
    @channel.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_channel
      @channel = Channel.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def channel_params
      params.require(:channel).permit(:title, :description, :category, :user_id, members: [])
    end

    def channel_user?
      render json: { errors: ['Forbidden access'] }, status: :forbidden unless @channel.access?(@current_user)
    end
end
