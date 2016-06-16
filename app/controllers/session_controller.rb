class SessionController < ApplicationController
  skip_before_action :authorize, only: [:create, :new]

  def new
    @user = User.new
    # if request.xhr?
    # render 'session/new'
    # end
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      puts "logging in"
      log_in @user
      redirect_to user_path(@user)
    else
      @errors = ["Invalid Credentials"]
      render 'session/new', locals: {errors: @errors}
    end
  end

  private
  
  def destroy
    log_out
    redirect_to root_url
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    session.delete(:user_id)
  end

end
