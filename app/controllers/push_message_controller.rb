require 'net/http'
require 'uri'

class PushMessageController < ApplicationController
  def send_message
    @message = params[:message]
    @reg_id = Key.find_by_name("registration_id").value
    postData = Net::HTTP.post_form(URI.parse('https://android.apis.google.com/c2dm/send'), 
                                   {'registration_id'=>@reg_id, "collapse_key" => "0", "data.payload" => @message})    
    @message_response = postData.body
  end

  

end
