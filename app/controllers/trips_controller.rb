class TripsController < ApplicationController
  before_action :authenticate!
  before_action :set_trip, only: [:show, :edit, :update, :destroy]
  before_action :check_owner, only: [:edit, :update, :destroy]

  # GET /trips
  # GET /trips.json
  def index
    @trips = Trip.all
  end

  # GET /trips/1
  # GET /trips/1.json
  def show
  end

  # GET /trips/new
  def new
    @trip = Trip.new
    if request.xhr?
      render partial: 'form'
    end
  end

  # GET /trips/1/edit
  def edit
  end

  # POST /trips
  # POST /trips.json
  def create
    @user = User.find(session[:user_id])
    coordinates = Geocoder.coordinates(trip_params[:name])
    @trip = @user.trips.new(trip_params)
    Trip.set_coordinates(@trip)

    respond_to do |format|
      if @trip.save

        format.html { redirect_to @trip, notice: 'Trip was successfully created.' }
        format.json { render json: @trip }
      else
        format.html { render :new }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trips/1
  # PATCH/PUT /trips/1.json
  def update
    respond_to do |format|
      if @trip.update(trip_params)
        format.html { redirect_to @user, notice: 'Trip was successfully updated.' }
        format.json { render :show, status: :ok, location: @trip }
      else
        format.html { render :edit }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trips/1
  # DELETE /trips/1.json
  def destroy
    @trip.destroy
    respond_to do |format|
      format.html { redirect_to trips_url, notice: 'Trip was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_trip
      @trip = Trip.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trip_params
      params.require(:trip).permit(:name, :user_id, :latitude, :longitude, :month, :year, :description, :method_of_travel)
    end

    def find_location
      location = Geocoder.coordinates(trip_params[:name])
      # render :json => (location)
      # Geocoder::Calculations.distance_between([47.858205,2.294359], [40.748433,-73.985655])
    end
end
