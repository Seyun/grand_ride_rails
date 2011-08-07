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

    @map_url = get_map_url(@ride.tracks)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ride }
    end
  end

  def get_map_url(tracks)
    map_url ='http://maps.google.com/maps/api/staticmap?size=300x400&sensor=false&path=color:0x0000ff|weight:5|enc:'
    encoder = GmapPolylineEncoder.new
    points = Array.new
    tracks.each_with_index do |t, index|
      points[index] = [t.latitude, t.longitude]
    end

    map_url << encoder.encode(points)[:points]
    return map_url
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
  
  # GET /rides/1/check_out
  def check_out
    @ride = Ride.find(params[:id])
    @ride.status = Ride::CHECKED_OUT
    
    respond_to do |format|
      if @ride.save
        format.html { redirect_to :action => 'show_status', :id => @ride.id }
      else
        format.html { render :json => "error" }
      end
    end
  end
  
  def show_status
    @ride = Ride.find(params[:id])
    @map_url = get_map_url(@ride.tracks)
    respond_to do |format|
      format.html
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
    @ride.status = Ride::CHECKED_IN
    monitor_email = params[:monitor][:email]
    
    respond_to do |format|
      if @ride.save
        if params[:monitor] != nil
          monitor_email = params[:monitor][:email]
          if monitor_email != nil
            ride_monitor = RideMonitor.new(:email => monitor_email, :ride_id => @ride.id)
            ride_monitor.save!
            logger.info "ride created, monitor: " + monitor_email
          end
        end
        
        Notifier.checked_in(@ride).deliver
        format.html { redirect_to :action => 'show_status', :id => @ride.id }
      else
        format.html { render :json => "error" }
        # format.html { render :action => "new" }
        # format.xml  { render :xml => @ride.errors, :status => :unprocessable_entity }
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

  # GET /record_track/1
  def record_track
    @ride = Ride.find(params[:id])  
    @track = Track.new(:ride_id => @ride.id, :latitude => params[:latitude], :longitude => params[:longitude])
    @track.save!
    
    redirect_to :action => 'show_status', :id => @ride.id
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
