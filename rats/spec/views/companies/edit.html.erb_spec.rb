require 'rails_helper'

RSpec.describe "companies/edit", type: :view do
  before(:each) do
    @company = assign(:company, Company.create!(
      :name => "MyString",
      :headquarters => "MyString",
      :website => "MyString",
      :size => "MyString",
      :synopsis => "MyText",
      :founded => 1,
      :industry => "MyString",
      :revenue => ""
    ))
  end

  it "renders the edit company form" do
    render

    assert_select "form[action=?][method=?]", company_path(@company), "post" do

      assert_select "input[name=?]", "company[name]"

      assert_select "input[name=?]", "company[headquarters]"

      assert_select "input[name=?]", "company[website]"

      assert_select "input[name=?]", "company[size]"

      assert_select "textarea[name=?]", "company[synopsis]"

      assert_select "input[name=?]", "company[founded]"

      assert_select "input[name=?]", "company[industry]"

      assert_select "input[name=?]", "company[revenue]"
    end
  end
end
