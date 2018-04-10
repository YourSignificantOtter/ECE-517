require 'rails_helper'

RSpec.describe "jobs/index", type: :view do
  before(:each) do
    assign(:jobs, [
      Job.create!(
        :company_id => 2,
        :employment_type => "Employment Type",
        :job_description => "MyText",
        :requirements => "MyText",
        :responsibilities => "MyText"
      ),
      Job.create!(
        :company_id => 2,
        :employment_type => "Employment Type",
        :job_description => "MyText",
        :requirements => "MyText",
        :responsibilities => "MyText"
      )
    ])
  end

  it "renders a list of jobs" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Employment Type".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
