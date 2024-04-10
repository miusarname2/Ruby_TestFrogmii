require 'net/http'
require 'json'

class EarthquakesController < ApplicationController
  before_action :set_earthquake, only: %i[ show edit update destroy ]

  # GET /earthquakes or /earthquakes.json
  def index
    @earthquakes = Earthquake.all

    if params[:page] && params[:page].to_i > 1
      puts params[:page]

      # si hay un parametro extra lo toma

      # ["md", "ml", "ms", "mw", "me", "mi", "mb", "mlg"]
      if params[:mag_type] && (params[:mag_type] == "md" || params[:mag_type] == "ml" || params[:mag_type] == "ms" || params[:mag_type] == "mw" || params[:mag_type] == "me" || params[:mag_type] == "mi" || params[:mag_type] == "mb" || params[:mag_type] == "mlg")

        totalReg = 10*params[:page].to_i
        mayor=totalReg-1
        minor=totalReg + 10
        @earthquakes = Earthquake.where("id > ?", mayor).where("id < ?", minor)


      if params[:per_page] && (params[:per_page].to_i <= 1000)
        total = params[:per_page].to_i
        @earthquakes = Earthquake.limit(total).where("id > ?", mayor)
        if @earthquakes.count >= total
          @earthquakes = Earthquake.limit(total).where("id > ?", mayor).where("id < ?", minor)
          return @earthquakes
        else
          base_url = 'https://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&starttime=NOW%20-%2030%20days'
          url = "#{base_url}&limit=#{total}"
          uri = URI(url)
          response = Net::HTTP.get(uri)
          data = JSON.parse(response)
          test_features = data['features']
          actual = @earthquakes.count
          puts actual

          test_features.drop(actual).each do |item|
            puts item['properties']['title']

            if item['properties']['tsunami'] != 0
              item['properties']['tsunami'] = true
            else
              item['properties']['tsunami'] = false
            end

            Earthquake.create(
              title: item['properties']['title'],
              mag_type: item['properties']['magType'],
              tsunami: item['properties']['tsunami'],
              time: item['properties']['time'].to_s,
              place: item['properties']['place'],
              magnitude: item['properties']['mag'],
              externa_id: item['id'],
              type: item['properties']['type'],
              latitude: item['geometry']['coordinates'][1],
              longitude: item['geometry']['coordinates'][0]
            )
          end
          @earthquakes = Earthquake.limit(total).where("id > ?", mayor)
          return @earthquakes
        end
      end

        totalReg = 10*params[:page].to_i
        mayor=totalReg-1
        minor=totalReg + 10
        equls=params[:mag_type]
        @earthquakes = Earthquake.where(mag_type: equls).where("id > ?", mayor).where("id < ?", minor)
        if @earthquakes.count >= 5

          @earthquakes = Earthquake.where(mag_type: equls).where("id > ?", mayor).where("id < ?", minor)
          return @earthquakes
        else
          base_url = 'https://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&starttime=NOW%20-%2030%20days'
          url = "#{base_url}&limit=#{minor}"
          uri = URI(url)
          response = Net::HTTP.get(uri)
          data = JSON.parse(response)
          test_features = data['features']
          actual = @earthquakes.count

          test_features.drop(actual).each do |item|
            puts item['properties']['title']

            if item['properties']['tsunami'] != 0
              item['properties']['tsunami'] = true
            else
              item['properties']['tsunami'] = false
            end

            Earthquake.create(
              title: item['properties']['title'],
              mag_type: item['properties']['magType'],
              tsunami: item['properties']['tsunami'],
              time: item['properties']['time'].to_s,
              place: item['properties']['place'],
              magnitude: item['properties']['mag'],
              externa_id: item['id'],
              type: item['properties']['type'],
              latitude: item['geometry']['coordinates'][1],
              longitude: item['geometry']['coordinates'][0]
            )
          end
          @earthquakes = Earthquake.where(mag_type: equls).where("id > ?", mayor).where("id < ?", minor)
          return @earthquakes
        end
      end

      totalReg = 10*params[:page].to_i
      mayor=totalReg-1
      minor=totalReg + 10
      @earthquakes = Earthquake.where("id > ?", mayor)
      if params[:per_page] && (params[:per_page].to_i <= 1000)
        total = params[:per_page].to_i
        @earthquakes = Earthquake.limit(total).where("id > ?", mayor)
        if @earthquakes.count >= total
          @earthquakes = Earthquake.limit(total).where("id > ?", mayor)
          return @earthquakes
        else
          base_url = 'https://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&starttime=NOW%20-%2030%20days'
          url = "#{base_url}&limit=#{total}"
          uri = URI(url)
          response = Net::HTTP.get(uri)
          data = JSON.parse(response)
          test_features = data['features']
          actual = @earthquakes.count

          test_features.drop(actual).each do |item|
            puts item['properties']['title']

            if item['properties']['tsunami'] != 0
              item['properties']['tsunami'] = true
            else
              item['properties']['tsunami'] = false
            end

            Earthquake.create(
              title: item['properties']['title'],
              mag_type: item['properties']['magType'],
              tsunami: item['properties']['tsunami'],
              time: item['properties']['time'].to_s,
              place: item['properties']['place'],
              magnitude: item['properties']['mag'],
              externa_id: item['id'],
              type: item['properties']['type'],
              latitude: item['geometry']['coordinates'][1],
              longitude: item['geometry']['coordinates'][0]
            )
          end
        end
      end

      #COMPLETED
      totalReg = 10*params[:page].to_i
      mayor=totalReg-1
      minor=totalReg + 10
      @earthquakes = Earthquake.where("id > ?", mayor).where("id < ?", minor)

      puts @earthquakes.count
      puts "this is a count"

      if @earthquakes.count >= 10

        render :index
      else
        base_url = 'https://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&starttime=NOW%20-%2030%20days'
        url = "#{base_url}&limit=#{minor}"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        data = JSON.parse(response)
        test_features = data['features']
        actual = @earthquakes.count

        test_features.drop(actual).each do |item|
          puts item['properties']['title']

          if item['properties']['tsunami'] != 0
            item['properties']['tsunami'] = true
          else
            item['properties']['tsunami'] = false
          end

          Earthquake.create(
            title: item['properties']['title'],
            mag_type: item['properties']['magType'],
            tsunami: item['properties']['tsunami'],
            time: item['properties']['time'].to_s,
            place: item['properties']['place'],
            magnitude: item['properties']['mag'],
            externa_id: item['id'],
            type: item['properties']['type'],
            latitude: item['geometry']['coordinates'][1],
            longitude: item['geometry']['coordinates'][0]
          )
        end
        @earthquakes = Earthquake.where("id > ?", mayor).where("id < ?", minor)
        return @earthquakes
      end

    end

    #completed all
    if params[:mag_type] && (params[:mag_type] == "md" || params[:mag_type] == "ml" || params[:mag_type] == "ms" || params[:mag_type] == "mw" || params[:mag_type] == "me" || params[:mag_type] == "mi" || params[:mag_type] == "mb" || params[:mag_type] == "mlg")
      equls=params[:mag_type]
      @earthquakes = Earthquake.where(mag_type: equls).where("id > ?", 1).where("id < ?", 20)

      if params[:per_page] && (params[:per_page].to_i <= 1000)
        total = params[:per_page].to_i
        if @earthquakes.count >= total
          @earthquakes = Earthquake.limit(total).where(mag_type: equls).where("id > ?", 1).where("id < ?", 20)
          return @earthquakes
        else
          base_url = 'https://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&starttime=NOW%20-%2030%20days'
          url = "#{base_url}&limit=#{total}"
          uri = URI(url)
          response = Net::HTTP.get(uri)
          data = JSON.parse(response)
          test_features = data['features']
          actual = @earthquakes.count

          test_features.drop(actual).each do |item|
            puts item['properties']['title']

            if item['properties']['tsunami'] != 0
              item['properties']['tsunami'] = true
            else
              item['properties']['tsunami'] = false
            end

            Earthquake.create(
              title: item['properties']['title'],
              mag_type: item['properties']['magType'],
              tsunami: item['properties']['tsunami'],
              time: item['properties']['time'].to_s,
              place: item['properties']['place'],
              magnitude: item['properties']['mag'],
              externa_id: item['id'],
              type: item['properties']['type'],
              latitude: item['geometry']['coordinates'][1],
              longitude: item['geometry']['coordinates'][0]
            )
          end
          @earthquakes = Earthquake.limit(total).where(mag_type: equls).where("id > ?", 1).where("id < ?", 20)
          return @earthquakes
        end
      end

      if @earthquakes.count >= 5

        @earthquakes = Earthquake.where(mag_type: equls).where("id > ?", 1).where("id < ?", 20)
        return @earthquakes
      else
        minor=20
        base_url = 'https://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&starttime=NOW%20-%2030%20days'
        url = "#{base_url}&limit=#{minor}"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        data = JSON.parse(response)
        test_features = data['features']
        actual = @earthquakes.count

        test_features.drop(actual).each do |item|
          puts item['properties']['title']

          if item['properties']['tsunami'] != 0
            item['properties']['tsunami'] = true
          else
            item['properties']['tsunami'] = false
          end

          Earthquake.create(
            title: item['properties']['title'],
            mag_type: item['properties']['magType'],
            tsunami: item['properties']['tsunami'],
            time: item['properties']['time'].to_s,
            place: item['properties']['place'],
            magnitude: item['properties']['mag'],
            externa_id: item['id'],
            type: item['properties']['type'],
            latitude: item['geometry']['coordinates'][1],
            longitude: item['geometry']['coordinates'][0]
          )
        end
        @earthquakes = Earthquake.where(mag_type: equls).where("id > ?", 1).where("id < ?", 20)
        return @earthquakes
      end
    end

    @earthquakes = Earthquake.all
    if params[:per_page] && (params[:per_page].to_i <= 1000)
      total = params[:per_page].to_i
      puts @earthquakes.count
      if @earthquakes.count >= total
        puts "passed"
        @earthquakes = Earthquake.limit(total)
        return @earthquakes
      else
        base_url = 'https://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&starttime=NOW%20-%2030%20days'
        url = "#{base_url}&limit=#{total}"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        data = JSON.parse(response)
        test_features = data['features']
        actual = @earthquakes.count

        test_features.drop(actual).each do |item|
          puts item['properties']['title']

          if item['properties']['tsunami'] != 0
            item['properties']['tsunami'] = true
          else
            item['properties']['tsunami'] = false
          end

          Earthquake.create(
            title: item['properties']['title'],
            mag_type: item['properties']['magType'],
            tsunami: item['properties']['tsunami'],
            time: item['properties']['time'].to_s,
            place: item['properties']['place'],
            magnitude: item['properties']['mag'],
            externa_id: item['id'],
            type: item['properties']['type'],
            latitude: item['geometry']['coordinates'][1],
            longitude: item['geometry']['coordinates'][0]
          )
        end
        @earthquakes = Earthquake.limit(total)
        return @earthquakes
      end
    end

    #completed
    @earthquakes = Earthquake.all

    if @earthquakes.count >= 19

      @earthquakes = Earthquake.where("id < ?", 20)
    else
      uri = URI('https://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&limit=20&starttime=NOW%20-%2030%20days')
      response = Net::HTTP.get(uri)
      data = JSON.parse(response)
      test_features = data['features']
      #first_fea = data['features'][0]

      #puts first_fea.inspect

      #puts first_fea['properties']['title']
      actual =@earthquakes.count

      test_features.drop(actual).each do |item|
        puts item['properties']['title']

        if item['properties']['tsunami'] != 0
          item['properties']['tsunami'] = true
        else
          item['properties']['tsunami'] = false
        end

        Earthquake.create(title: item['properties']['title'],mag_type:item['properties']['magType'],tsunami:item['properties']['tsunami'],time:item['properties']['time'].to_s,place:item['properties']['place'],magnitude:item['properties']['mag'],externa_id:item['id'],type:item['properties']['type'],latitude:item['geometry']['coordinates'][1],longitude:item['geometry']['coordinates'][0] )
      end
      @earthquakes = Earthquake.where("id < ?", 20)
      return @earthquakes
    end
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
