require 'rails_helper'

RSpec.describe "InterlineCxrRules", :type => :request do
  describe "GET /interline_cxr_rules" do
    it "works! (now write some real specs)" do
      get interline_cxr_rules_path
      expect(response.status).to be(200)
    end
  end
end
