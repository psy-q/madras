module Api
  module V1

    class ApplicationController < ActionController::Base
      protect_from_forgery

      def securityChecks apiKey

        if apiKey.blank? == true
          render status: 401, text: 'unauthorized1'
        end
      end
    end

  end
end
