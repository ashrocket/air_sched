require 'rails_helper'

RSpec.describe "interline_cxr_rules/index", :type => :view do
  before(:each) do
    assign(:interline_cxr_rules, [
      InterlineCxrRule.create!(
        :data_key => nil,
        :markets => "MyText",
        :combinations => "MyText",
        :rule_kind => "Rule Kind",
        :active => false
      ),
      InterlineCxrRule.create!(
        :data_key => nil,
        :markets => "MyText",
        :combinations => "MyText",
        :rule_kind => "Rule Kind",
        :active => false
      )
    ])
  end

  it "renders a list of interline_cxr_rules" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Rule Kind".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
