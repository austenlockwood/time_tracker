# RuboCop wants a top-level class documentation comment here
class TimeLogsController < ApplicationController
  before_action :check_for_authorized_user
  rescue_from ActiveRecord::RecordNotFound, with: :unauthorized

  def index
    # @time_logs = TimeLog.where(developer_id: current_user.id)
    @time_logs = current_user.time_logs
  end

  def new
    @time_log = TimeLog.new
  end

  def create
    @time_log = current_user.time_logs.build(time_log_params)
    if @time_log.save
      redirect_to time_logs_path
    else
      render :new
    end
  end

  def edit
    @time_log = current_user.time_logs.find(params['id'])
  end

  def update
    @time_log = current_user.time_logs.find(params['id'])

    if @time_log.update(time_log_params)
      redirect_to time_logs_path
    else
      render :edit
    end
  end

  def destroy
    @time_log = current_user.time_logs.find(params['id'])
    @time_log.destroy
    redirect_to time_logs_path
  end

  private def time_log_params
    params.require('time_log').permit(:date, :minutes, :project_id)
  end

  private def unauthorized
    redirect_to time_logs_path, notice: 'You do not have access to this page.'
  end
end
