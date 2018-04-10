require 'rails_helper'

RSpec.describe "companies/show", type: :view do
  before(:each) do
    @company = assign(:company, Company.create!(
      :name => "Name",
      :headquarters => "Headquarters",
      :website => "Website",
      :size => "Size",
      :synopsis => "MyText",
      :founded => 2,
      :industry => "Industry",
      :revenue => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Headquarters/)
    expect(rendered).to match(/Website/)
    expect(rendered).to match(/Size/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Industry/)
    expect(rendered).to match(//)
  end
end
