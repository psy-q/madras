module Api
  module V1
    require 'security.rb'


    class PeopleController < ApplicationController

      before_filter do
        @apiKey = params[:apikey]
        securityChecks @apiKey
      end

      respond_to :xml, :json


      def initialize
      end



      def index
        logger.debug "gotta list something"
      end



      def show
        userId = params[:id]
        requestedRoute = request.path

        tableFields = Madras::MadrasField.joins(:madrasapplications, :madrasroutes)
          .where('MadrasApplication.APIKey = ?', @apiKey)
          .where('MadrasPermission.PermissionTypeId = 2')
          .where('? LIKE MadrasRoute.RoutePattern', requestedRoute)

        if tableFields.count > 0
          selectProjection = tableFields.map { |e| e.Name }.join(",")

          begin
            personRecords = Evento::Person.select(selectProjection).find(userId)
            respond_with personRecords
          rescue ActiveRecord::RecordNotFound
            render status: 404, text: 'record not found'
          rescue
            render status: 400, text: 'bad request'
          end
        else
          render status: 401, text: 'unauthorized2'
        end
      end


      def update
        puts "gotta update something"
      end


      def delete
        puts "gotta delete something"
      end

    end

  end
end
