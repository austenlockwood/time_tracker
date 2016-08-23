class TimeLogsController < ApplicationController

  def index
    @time_logs = TimeLog.all
  end

  def new
    @time_log = TimeLog.new
  end

  def create
    @time_log = TimeLog.new(time_log_params)
    if @time_log.save
      redirect_to time_logs_path
    else
      render :new
    end
  end

  def edit
    @time_log = TimeLog.find(params["id"])
  end

  def update
    @time_log = TimeLog.find(params["id"])

    if @time_log.update(time_log_params)
      redirect_to time_logs_path
    else
      render :edit
    end
  end

  private def time_log_params
    params.require("time_log").permit(:developer_id, :date, :minutes, :project_id)
  end

end
