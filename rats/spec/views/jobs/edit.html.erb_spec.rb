require 'rails_helper'

RSpec.describe "jobs/edit", type: :view do
  before(:each) do
    @job = assign(:job, Job.create!(
      :company_id => 1,
      :employment_type => "MyString",
      :job_description => "MyText",
      :requirements => "MyText",
      :responsibilities => "MyText"
    ))
  end

  it "renders the edit job form" do
    render

    assert_select "form[action=?][method=?]", job_path(@job), "post" do

      assert_select "input[name=?]", "job[company_id]"

      assert_select "input[name=?]", "job[employment_type]"

      assert_select "textarea[name=?]", "job[job_description]"

      assert_select "textarea[name=?]", "job[requirements]"

      assert_select "textarea[name=?]", "job[responsibilities]"
    end
  end
end
