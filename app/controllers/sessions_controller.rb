class SessionsController < ApplicationController
  #show form
  def new
  end

  #do work when they submit form
  def create
    # @developer = Developer.find_by(email: "russell@tiy.com")
    @developer = Developer.find_by(email: params[:email])
    #they log in right
    if @developer.authenticate(params[:password])
      # need to be remembered as logged in on all pages
      session[:developer_id] = @developer.id
      # session[:its_a_party_key] = "You logged in dude"
      #they get a welcome page REDIRECT
      redirect_to root_path
    else
      render :new, notice: "Password or username wrong. Try again."
    end
  end

  #
  def destroy

  end
end
