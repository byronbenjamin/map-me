class UsersController < ApplicationController
  before_action :authenticate!, :except => [:new, :create]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :check_owner, only: [:edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    @trips = @user.trips.order("trips.name").all
    @future_trips = @user.future_trips.order("future_trips.name").all
  end

  # GET /users/new
  def new
    @user = User.new
    if request.xhr?
      render partial: 'form'
    end
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    # respond_to do |format|
    if @user.save
      log_in @user
      if request.xhr?
        render :json => {:user_path => user_path(@user)}
      else
        redirect_to user_path(@user)
      end
    else
      if request.xhr?
        render partial: 'form'
      else
        render 'new'
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def check_owner
      if @user != current_user
        # flash[:notice] = "You are not authorized to do that."
        redirect_to user_path(@user)
      end
    end

    def log_in(user)
      session[:user_id] = user.id
    end

    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username,:email,:password)
    end
end
