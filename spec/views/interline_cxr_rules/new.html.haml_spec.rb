require 'rails_helper'

RSpec.describe "interline_cxr_rules/new", :type => :view do
  before(:each) do
    assign(:interline_cxr_rule, InterlineCxrRule.new(
      :data_key => nil,
      :markets => "MyText",
      :combinations => "MyText",
      :rule_kind => "MyString",
      :active => false
    ))
  end

  it "renders new interline_cxr_rule form" do
    render

    assert_select "form[action=?][method=?]", interline_cxr_rules_path, "post" do

      assert_select "input#interline_cxr_rule_data_key_id[name=?]", "interline_cxr_rule[data_key_id]"

      assert_select "textarea#interline_cxr_rule_markets[name=?]", "interline_cxr_rule[markets]"

      assert_select "textarea#interline_cxr_rule_combinations[name=?]", "interline_cxr_rule[combinations]"

      assert_select "input#interline_cxr_rule_rule_kind[name=?]", "interline_cxr_rule[rule_kind]"

      assert_select "input#interline_cxr_rule_active[name=?]", "interline_cxr_rule[active]"
    end
  end
end
