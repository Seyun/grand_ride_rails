class TracksController < ApplicationController
  def create
    @ride = Ride.find(params[:ride_id])
    @track = @ride.tracks.create(params[:track])
    redirect_to ride_path(@ride)
  end
end
