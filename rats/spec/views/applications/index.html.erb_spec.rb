require 'rails_helper'

RSpec.describe "applications/index", type: :view do
  before(:each) do
    assign(:applications, [
      Application.create!(
        :job_id => 2,
        :user_id => 3,
        :gender => "Gender",
        :additional_info => "MyText",
        :portfolio_url => "Portfolio Url",
        :linkedin_url => "Linkedin Url",
        :current_company => "Current Company",
        :disability_status => "Disability Status",
        :veteran_status => "Veteran Status",
        :race => ""
      ),
      Application.create!(
        :job_id => 2,
        :user_id => 3,
        :gender => "Gender",
        :additional_info => "MyText",
        :portfolio_url => "Portfolio Url",
        :linkedin_url => "Linkedin Url",
        :current_company => "Current Company",
        :disability_status => "Disability Status",
        :veteran_status => "Veteran Status",
        :race => ""
      )
    ])
  end

  it "renders a list of applications" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Gender".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Portfolio Url".to_s, :count => 2
    assert_select "tr>td", :text => "Linkedin Url".to_s, :count => 2
    assert_select "tr>td", :text => "Current Company".to_s, :count => 2
    assert_select "tr>td", :text => "Disability Status".to_s, :count => 2
    assert_select "tr>td", :text => "Veteran Status".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
