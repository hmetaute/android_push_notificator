class MapController < ApplicationController
  def show_position
    @position = Key.find(params[:id])
    # @position = Key.where(:name => "coordinates").order("created_at DESC").first
    if @position
      @lat = @position.value.split(";").first
      @long = @position.value.split(";").last
    end
  end

end
