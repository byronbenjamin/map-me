class SessionController < ApplicationController
  skip_before_action :authorize, only: [:create, :new]

  def new
    @user = User.new
    if request.xhr?
      render partial: 'login'
    end
  end

  def create
    @user = User.find_by(email: session_params[:email])
    if @user && @user.authenticate(session_params[:password])
      log_in @user
      if request.xhr?
        render :json => {:user_path => user_path(@user)}
      else
        puts "logging in"
        redirect_to user_path(@user)
      end
    else
      @errors = ["Invalid Credentials"]
      if request.xhr?
        render :json => {:error => "Invalid Credentials"}, :status => 422
      else
        render 'session/new', locals: {errors: @errors}
      end
    end
  end


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

  private

    def session_params
      params.require(:session).permit(:email, :password)
    end
end
