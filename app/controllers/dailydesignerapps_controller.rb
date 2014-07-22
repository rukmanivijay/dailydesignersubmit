require 'open-uri'

class DailydesignerappsController < ApplicationController
  before_action :set_dailydesignerapp, only: [:show, :edit, :update, :destroy]

  # GET /dailydesignerapps
  # GET /dailydesignerapps.json
  def index
    @dailydesignerapps = Dailydesignerapp.all
  end

  # GET /dailydesignerapps/1
  # GET /dailydesignerapps/1.json
  def show
    #Dealing with one/two word city name
    #Assigning the one word state name.
    @city = @dailydesignerapp.city
    @city= @city.split(' ') 
    @city = @city.join('_')
    @state = @dailydesignerapp.state
    
   
    @weather_api = "http://api.wunderground.com/api/6174511a0d156421/conditions/q/"+@state+"/"+@city+".json"
    @encode_weather_url = URI.encode(@weather_api)
    @open_weather_api = open(@encode_weather_url).read
    @json_decode = JSON.parse(@open_weather_api)
    @temperature_string = @json_decode["current_observation"]["temperature_string"]
    @clear_day = @json_decode["current_observation"]["weather"]
  end

  def main
    @dailydesignerapps = Dailydesignerapp.all
    respond_to do |format|
      format.html
    end
  end

  def summer
    @dailydesignerapps = Dailydesignerapp.all
    respond_to do |format|
      format.html
    end
  end

    def winter
    @dailydesignerapps = Dailydesignerapp.all
    respond_to do |format|
      format.html
    end
  end

  # GET /dailydesignerapps/new
  def new
    @dailydesignerapp = Dailydesignerapp.new
  end

  # GET /dailydesignerapps/1/edit
  def edit
  end

  # POST /dailydesignerapps
  # POST /dailydesignerapps.json
  def create
    @dailydesignerapp = Dailydesignerapp.new(dailydesignerapp_params)

    respond_to do |format|
      if @dailydesignerapp.save
        format.html { redirect_to @dailydesignerapp, notice: 'Dailydesignerapp was successfully created.' }
        format.json { render :show, status: :created, location: @dailydesignerapp }
      else
        format.html { render :new }
        format.json { render json: @dailydesignerapp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dailydesignerapps/1
  # PATCH/PUT /dailydesignerapps/1.json
  def update
    respond_to do |format|
      if @dailydesignerapp.update(dailydesignerapp_params)
        format.html { redirect_to @dailydesignerapp, notice: 'Dailydesignerapp was successfully updated.' }
        format.json { render :show, status: :ok, location: @dailydesignerapp }
      else
        format.html { render :edit }
        format.json { render json: @dailydesignerapp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dailydesignerapps/1
  # DELETE /dailydesignerapps/1.json
  def destroy
    @dailydesignerapp.destroy
    respond_to do |format|
      format.html { redirect_to dailydesignerapps_url, notice: 'Dailydesignerapp was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dailydesignerapp
      @dailydesignerapp = Dailydesignerapp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dailydesignerapp_params
      params.require(:dailydesignerapp).permit(:name, :sex, :state, :city)
    end
end
