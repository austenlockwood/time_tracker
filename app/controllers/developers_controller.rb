class DevelopersController < ApplicationController
# use instance variable when you want data to flow to view
  def index
    @developers = Developer.all
  end
  # this method is an action
  def new
    @developer = Developer.new
  end

  def create
    @developer = Developer.new(developer_params)
    if @developer.save
      redirect_to developers_path
    else
      render :new
    end
  end

  def show
    #code
  end

  def edit
    @developer = Developer.find(params["id"])
  end

  def update
    @developer = Developer.find(params["id"])

    if @developer.update(developer_params)
      redirect_to developers_path
    else
      render :edit
    end
  end

  def destroy
    #code
  end

  private def developer_params
    params.require("developer").permit(:name, :email, :password_digest)
  end
end
