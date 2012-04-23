require 'net/http'
require 'uri'

class PushMessageController < ApplicationController
  def send_message
    @message = params[:message]
    @reg_id = Key.find_by_name("registration_id").value
    uri = URI.parse('https://android.apis.google.com/c2dm/send')
    params = {'registration_id'=>@reg_id, "collapse_key" => "0", "data.payload" => @message}
    postData = Net::HTTP.post_form(uri,params)    
    @message_response = postData.body
  end

  

end
