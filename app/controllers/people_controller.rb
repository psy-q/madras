require 'security.rb'


class PeopleController < ApplicationController

  before_filter { |c| c.checkApiKey params[:apikey] }
  respond_to :xml, :json


  def initialize
  end


  # Security checks : right verb, correct URI, correct parameters
  def securityChecks
  end




  def index
    logger.debug "gotta list something"
  end




  def show
    apiKey = params[:apikey]
    userId = params[:id]
    requestedRoute = request.path

    tableFields = Madras::MadrasField.joins(:madrasapplications, :madrasroutes)
      .where('[tblCst_ZHdK_Madras2_Application].[Key] = ?', apiKey)
      .where('? LIKE [tblCst_ZHdK_Madras2_route].[RoutePattern]', requestedRoute)
  
    if tableFields.count > 0
      selectProjection = tableFields.map { |e| e.Name }.join(",")
  
      begin
        personRecords = Evento::Person.select(selectProjection).find(userId)
        respond_with personRecords
      rescue ActiveRecord::RecordNotFound
        render status: 404, text: 'record was not found'
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
