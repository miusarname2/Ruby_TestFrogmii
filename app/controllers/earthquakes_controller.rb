class EarthquakesController < ApplicationController
  before_action :set_earthquake, only: %i[ show edit update destroy ]

  # GET /earthquakes or /earthquakes.json
  def index
    @earthquakes = Earthquake.all
  end

  # GET /earthquakes/1 or /earthquakes/1.json
  def show
  end

  # GET /earthquakes/new
  def new
    @earthquake = Earthquake.new
  end

  # GET /earthquakes/1/edit
  def edit
  end

  # POST /earthquakes or /earthquakes.json
  def create
    @earthquake = Earthquake.new(earthquake_params)

    respond_to do |format|
      if @earthquake.save
        format.html { redirect_to earthquake_url(@earthquake), notice: "Earthquake was successfully created." }
        format.json { render :show, status: :created, location: @earthquake }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @earthquake.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /earthquakes/1 or /earthquakes/1.json
  def update
    respond_to do |format|
      if @earthquake.update(earthquake_params)
        format.html { redirect_to earthquake_url(@earthquake), notice: "Earthquake was successfully updated." }
        format.json { render :show, status: :ok, location: @earthquake }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @earthquake.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /earthquakes/1 or /earthquakes/1.json
  def destroy
    @earthquake.destroy

    respond_to do |format|
      format.html { redirect_to earthquakes_url, notice: "Earthquake was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_earthquake
      @earthquake = Earthquake.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def earthquake_params
      params.require(:earthquake).permit(:latitude, :longitude, :title, :mag_type, :tsunami, :time, :place, :magnitude, :externa_id, :type)
    end
end
