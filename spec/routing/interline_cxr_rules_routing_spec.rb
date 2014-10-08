require "rails_helper"

RSpec.describe InterlineCxrRulesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/interline_cxr_rules").to route_to("interline_cxr_rules#index")
    end

    it "routes to #new" do
      expect(:get => "/interline_cxr_rules/new").to route_to("interline_cxr_rules#new")
    end

    it "routes to #show" do
      expect(:get => "/interline_cxr_rules/1").to route_to("interline_cxr_rules#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/interline_cxr_rules/1/edit").to route_to("interline_cxr_rules#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/interline_cxr_rules").to route_to("interline_cxr_rules#create")
    end

    it "routes to #update" do
      expect(:put => "/interline_cxr_rules/1").to route_to("interline_cxr_rules#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/interline_cxr_rules/1").to route_to("interline_cxr_rules#destroy", :id => "1")
    end

  end
end
