require 'rails_helper'

RSpec.describe "jobs/new", type: :view do
  before(:each) do
    assign(:job, Job.new(
      :company_id => 1,
      :employment_type => "MyString",
      :job_description => "MyText",
      :requirements => "MyText",
      :responsibilities => "MyText"
    ))
  end

  it "renders new job form" do
    render

    assert_select "form[action=?][method=?]", jobs_path, "post" do

      assert_select "input[name=?]", "job[company_id]"

      assert_select "input[name=?]", "job[employment_type]"

      assert_select "textarea[name=?]", "job[job_description]"

      assert_select "textarea[name=?]", "job[requirements]"

      assert_select "textarea[name=?]", "job[responsibilities]"
    end
  end
end
