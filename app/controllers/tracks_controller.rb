class TracksController < ApplicationController
  # GET
  def create
    track = Track.new(params)
    if track.save
      render :text => "SUCCESS"
    else
      render :text => "FAIL"
    end
    
    # redirect_to ride_path(@ride)
  end
end
