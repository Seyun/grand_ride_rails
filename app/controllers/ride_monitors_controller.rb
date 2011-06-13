class RideMonitorsController < ApplicationController
  # GET /ride_monitors
  # GET /ride_monitors.xml
  def index
    @ride_monitors = RideMonitor.all

    respond_to do |format|
      format.html # index_old.html.erb
      format.xml  { render :xml => @ride_monitors }
      format.json { render :json => @ride_monitors }
    end
  end

  # POST /ride_monitors
  # POST /ride_monitors.xml
  def create
    @ride_monitor = RideMonitor.new(params[:ride_monitor])

    respond_to do |format|
      if @ride_monitor.save
        format.html { redirect_to(@ride_monitor, :notice => 'Ride was successfully created.') }
        format.xml  { render :xml => @ride_monitor, :status => :created, :location => @ride_monitor }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ride_monitor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # GET /ride_monitors/new
  # GET /ride_monitors/new.xml
  def new
    @ride_monitor = RideMonitor.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ride_monitor }
    end
  end
end
