class FutureTripsController < ApplicationController
  before_action :authenticate!, :except => [:new]
  before_action :set_future_trip, only: [:show, :edit, :update, :destroy]
  before_action :check_owner, only: [:edit, :update, :destroy]

  # GET /future_trips
  # GET /future_trips.json
  def index
    @future_trips = FutureTrip.all
  end

  # GET /future_trips/1
  # GET /future_trips/1.json
  def show
  end

  # GET /future_trips/new
  def new
    @future_trip = FutureTrip.new
  end

  # GET /future_trips/1/edit
  def edit
  end

  # POST /future_trips
  # POST /future_trips.json
  def create
    @future_trip = FutureTrip.new(future_trip_params)

    respond_to do |format|
      if @future_trip.save
        format.html { redirect_to @future_trip, notice: 'Future trip was successfully created.' }
        format.json { render :show, status: :created, location: @future_trip }
      else
        format.html { render :new }
        format.json { render json: @future_trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /future_trips/1
  # PATCH/PUT /future_trips/1.json
  def update
    respond_to do |format|
      if @future_trip.update(future_trip_params)
        format.html { redirect_to @future_trip, notice: 'Future trip was successfully updated.' }
        format.json { render :show, status: :ok, location: @future_trip }
      else
        format.html { render :edit }
        format.json { render json: @future_trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /future_trips/1
  # DELETE /future_trips/1.json
  def destroy
    @future_trip.destroy
    respond_to do |format|
      format.html { redirect_to future_trips_url, notice: 'Future trip was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_future_trip
      @future_trip = FutureTrip.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def future_trip_params
      params.require(:future_trip).permit(:user_id, :location, :month, :year, :description)
    end
end
