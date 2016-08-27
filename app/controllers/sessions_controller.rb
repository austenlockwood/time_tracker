# RuboCop wants a top-level class documentation comment here
class SessionsController < ApplicationController
  # show form
  def new
  end

  # do work when they submit form
  def create
    # @developer = search database for email that was typed in
    @developer = Developer.find_by(email: params[:email])
    # if they log in right:
    if @developer && @developer.authenticate(params[:password])
      # need to be remembered as logged in on all pages
      session[:developer_id] = @developer.id
      session[:developer_welcome] = @developer.name
      # session[:its_a_party_key] = "You logged in dude"
      # they get a welcome page REDIRECT
      redirect_to root_path, notice: "Welcome back, #{@developer.name}!"
    else
      flash[:notice] = 'Password or username wrong. Try again.'
      render :new
    end
  end

  # end session by resetting developer id to nil
  def destroy
    session[:developer_id] = nil
    redirect_to sessions_new_path
  end
end
