require 'rails_helper'

RSpec.describe "companies/index", type: :view do
  before(:each) do
    assign(:companies, [
      Company.create!(
        :name => "Name",
        :headquarters => "Headquarters",
        :website => "Website",
        :size => "Size",
        :synopsis => "MyText",
        :founded => 2,
        :industry => "Industry",
        :revenue => ""
      ),
      Company.create!(
        :name => "Name",
        :headquarters => "Headquarters",
        :website => "Website",
        :size => "Size",
        :synopsis => "MyText",
        :founded => 2,
        :industry => "Industry",
        :revenue => ""
      )
    ])
  end

  it "renders a list of companies" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Headquarters".to_s, :count => 2
    assert_select "tr>td", :text => "Website".to_s, :count => 2
    assert_select "tr>td", :text => "Size".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Industry".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
