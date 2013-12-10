class ApplicationController < ActionController::Base
  protect_from_forgery


  def checkApiKey apiKey
    if apiKey.blank?
      render status: 401, text: 'unauthorized'
    end
  end

end
