require 'rails_helper'

RSpec.describe "applications/new", type: :view do
  before(:each) do
    assign(:application, Application.new(
      :job_id => 1,
      :user_id => 1,
      :gender => "MyString",
      :additional_info => "MyText",
      :portfolio_url => "MyString",
      :linkedin_url => "MyString",
      :current_company => "MyString",
      :disability_status => "MyString",
      :veteran_status => "MyString",
      :race => ""
    ))
  end

  it "renders new application form" do
    render

    assert_select "form[action=?][method=?]", applications_path, "post" do

      assert_select "input[name=?]", "application[job_id]"

      assert_select "input[name=?]", "application[user_id]"

      assert_select "input[name=?]", "application[gender]"

      assert_select "textarea[name=?]", "application[additional_info]"

      assert_select "input[name=?]", "application[portfolio_url]"

      assert_select "input[name=?]", "application[linkedin_url]"

      assert_select "input[name=?]", "application[current_company]"

      assert_select "input[name=?]", "application[disability_status]"

      assert_select "input[name=?]", "application[veteran_status]"

      assert_select "input[name=?]", "application[race]"
    end
  end
end
