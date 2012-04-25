require 'net/http'
require 'uri'

class PushMessageController < ApplicationController
  def send_message
    @auth_key = "DQAAAL8AAACXGEdrjt0wYmkfHZhSrNCMwk503jpx28g93zOUdEN-P1WmfE9Eod1lCbYEUURUuaLJfElRDcsBeYe6XpxxhBTxi39c7vTaz_uikDlJxiYE59wQ9cCGeZ9uz2ROAQFdHuYl-uraJxC4vrYhVaH-m0asYE037u0-_Hz05aBDhagccqEZrvSwUGyqDAxKBxnmXyonEfEcapYls5IgTCb48MMopSzWG5ygVVIBDGjzB2WceK62kVTANcAwgDxaUteBdFc"

    headers = { "Content-Type" => "application/x-www-form-urlencoded", 
      "Authorization" => "GoogleLogin auth=#{@auth_key}" }
    
    @message = params[:message]
    @reg_id = Key.find_by_name("registration_id").value
    uri = URI.parse('https://android.apis.google.com/c2dm/send')
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    collapse_key = "0"
    data = "registration_id=#{@reg_id}&collapse_key=#{collapse_key}&data.payload=#{@message}"
    #req = NET::HTTP::Post.new(uri.path)
    #params = {'registration_id'=>@reg_id, "collapse_key" => "0", "data.payload" => @message}
    #postData = Net::HTTP.post_form(uri,params)    
    resp, dat = http.post(uri.path, data, headers)
    @message_response = dat + ";" + resp.code.to_s
    redirect_to keys_url    
  end

  

end
