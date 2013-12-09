class PeopleController < ApplicationController


  respond_to :xml, :json

  def index
    puts "gotta list something"
  end


  def show
    myKey = params[:apikey]
    myId = params[:id]
    myRoute = request.path

    if (myKey.length > 0)

      tableFields = Madras::MadrasField.joins(:madrasapplications, :madrasroutes)
        .where('[tblCst_ZHdK_Madras2_Application].[Key] = ?', myKey)
        .where('? LIKE [tblCst_ZHdK_Madras2_route].[RoutePattern]', myRoute)

      if tableFields.count > 0

        selectProjection = tableFields.map { |e| e.Name }.join(",")
        personRecords = Evento::Person.select(selectProjection).find(myId)


        respond_to do |format|
          format.xml { render :xml => personRecords.to_xml }
          format.json { render :json => personRecords.to_json }
        end
      end
    end
  end


  def update
    puts "gotta update something"
  end

  
  def delete
    puts "gotta delete something"
  end

end
