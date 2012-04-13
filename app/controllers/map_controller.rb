class MapController < ApplicationController
  def show_position
    @position = Key.find_by_name("position")
    if @position
      @lat = @position.value.split(";").first
      @long = @position.value.split(";").last
    end
  end

end
