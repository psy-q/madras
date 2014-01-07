require 'spec_helper'


describe Api::V1::PeopleController do
  render_views



  describe "Base ... " do

#    before :each do
#      EventoDb.clean_up
#      EventoDb.seed
#    end


    it "the requested data representation by default is structured in JSON" do
      get :show, :id => '10262', :apikey => 'ValidKey'

      expect(response).to be_success
      expect(response.content_type == 'application/json').to be_true
    end


    it "the requested data representation is structured in JSON" do
      get :show, :id => '10262', :format => 'json', :apikey => 'ValidKey'

      expect(response).to be_success
      expect(response.content_type == 'application/json').to be_true
    end


    it "the requested data representation is structured in XML" do
      get :show, :id => '10262', :format => 'xml', :apikey => 'ValidKey'

      expect(response).to be_success
      expect(response.content_type == 'application/xml').to be_true
    end

  end



  describe "INDEX ... " do

    it "listing Person set with the default maximum of DEFAULT_PAGE_SIZE" do
    end


    it "listing Person set with user defined page size 5" do
    end


    it "listing Person set with user defined page size > MAX_PAGE_SIZE" do
    end


    it "listing Person set page 3" do
    end


    it "listing Person set page 3 and user defined page size of 5" do
    end

  end




  describe "SHOW ... " do

    it "requestsing a non existing URI" do
      get :show, :id => '10261', :format => 'json', :apikey => 'ValidKey'

      expect(response.code == '404').to be_true
      expect(response.body == 'record not found').to be_true
    end


    it "requests an existing user with an invalid api key" do
      get :show, :id => '10262', :format => 'json', :apikey => 'InvalidKey'

      expect(response.code == '401').to be_true
      expect(response.body == 'unauthorized2').to be_true
    end


    it "requestsing a resource with a valid API key that has no permissions" do
      get :show, :id => '10262', :format => 'json', :apikey => 'ValidKeyNoPermissions'

      expect(response.code == '401').to be_true
      expect(response.body == 'unauthorized2').to be_true
    end


    it "requests an existing user with valid api key" do
      get :show, :id => '10262', :format => 'json', :apikey => 'ValidKey'

      expect(response).to be_success
      expect(JSON.parse(response.body)["IdPerson"] == 10262).to be_true
    end

  end

end
