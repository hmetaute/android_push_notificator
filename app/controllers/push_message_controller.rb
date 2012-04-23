class PushMessageController < ApplicationController
  def send_message
    @message = params[:message]
  end

  

end
