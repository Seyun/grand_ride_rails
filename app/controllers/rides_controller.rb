class RidesController < ApplicationController
  # GET /rides
  # GET /rides.xml
  def index
    @rides = Ride.all

    respond_to do |format|
      format.html # index_old.html.erb
      format.xml  { render :xml => @rides }
      format.json { render :json => @rides }
    end
  end

  # GET /rides/1
  # GET /rides/1.xml
  def show
    @ride = Ride.find(params[:id])

    @map_url ='http://maps.google.com/maps/api/staticmap?size=512x512&sensor=false&path=color:0x0000ff|weight:5|enc:'

    encoder = GmapPolylineEncoder.new
    points = Array.new
    @ride.tracks.each_with_index do |t, index|
      points[index] = [t.latitude, t.longitude]
    end

    @map_url << encoder.encode(points)[:points]

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ride }
    end
  end

  # GET /rides/new
  # GET /rides/new.xml
  def new
    @ride = Ride.new
    @ride.ride_monitors.build
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ride }
    end
  end

  # GET /rides/1/edit
  def edit
    @ride = Ride.find(params[:id])
  end

  # POST /rides
  # POST /rides.xml
  def create
    @ride = Ride.new(params[:ride])

    respond_to do |format|
      if @ride.save
        Notifier.checked_in(@ride).deliver
        format.html { redirect_to(@ride, :notice => 'Ride was successfully created.') }
        format.xml  { render :xml => @ride, :status => :created, :location => @ride }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ride.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /rides/1
  # PUT /rides/1.xml
  def update
    @ride = Ride.find(params[:id])

    respond_to do |format|
      if @ride.update_attributes(params[:ride])
        format.html { redirect_to(@ride, :notice => 'Ride was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ride.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /rides/1
  # DELETE /rides/1.xml
  def destroy
    @ride = Ride.find(params[:id])
    @ride.destroy

    respond_to do |format|
      format.html { redirect_to(rides_url) }
      format.xml  { head :ok }
    end
  end

end
