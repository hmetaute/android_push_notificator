class MapController < ApplicationController
  def show_position
    id = params[:id]
    @position = Key.find[id]
    # @position = Key.where(:name => "coordinates").order("created_at DESC").first
    if @position
      @lat = @position.value.split(";").first
      @long = @position.value.split(";").last
    end
  end

end
