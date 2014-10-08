require 'rails_helper'

RSpec.describe "interline_cxr_rules/show", :type => :view do
  before(:each) do
    @interline_cxr_rule = assign(:interline_cxr_rule, InterlineCxrRule.create!(
      :data_key => nil,
      :markets => "MyText",
      :combinations => "MyText",
      :rule_kind => "Rule Kind",
      :active => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Rule Kind/)
    expect(rendered).to match(/false/)
  end
end
