require 'rails_helper'

RSpec.describe "applications/show", type: :view do
  before(:each) do
    @application = assign(:application, Application.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Gender/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Portfolio Url/)
    expect(rendered).to match(/Linkedin Url/)
    expect(rendered).to match(/Current Company/)
    expect(rendered).to match(/Disability Status/)
    expect(rendered).to match(/Veteran Status/)
    expect(rendered).to match(//)
  end
end
