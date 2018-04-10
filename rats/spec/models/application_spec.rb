require 'rails_helper'

RSpec.describe Application, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"

  before(:each) do
    @user = User.new(email: 'test@test.com', password: 'password', name: 'Tester')
    @user.save
    @company = Company.new(name: 'Earth', headquarters: '3 Planet', website: "https://www.earth.com", size: "1000+", synopsis: "We have a hospitable environment", founded: 0, industry: "Planet", revenue: "$100 billion")
    @company.save
    @job = Job.new(company_id: @company.id, employment_type: 'Full Time', job_description: 'A job', requirements: 'Look alive', responsibilities: 'Stay alive', job_title: 'Human', user_id: 1)
    @job.save
  end

  subject {described_class.new(job_id: @job.id, user_id: @user.id, gender: "Male", additional_info: "Sassy", portfolio_url: "https://www.letmesave.com", linkedin_url: "https://www.linkedin.com/in/applicant", current_company: "Facebook", disability_status: "Yes, I have a disability", veteran_status: "No, I am not a veteran", race: "Two or more races", status: "Hired")}

  context 'validation tests' do
    it 'ensures job id present' do
      subject.job_id = nil
      expect(subject).to_not be_valid
    end

    it 'ensures user id present' do
      subject.user_id = nil
      expect(subject).to_not be_valid
    end

    it 'ensures gender present' do
      subject.gender = nil
      expect(subject).to_not be_valid
    end

    it 'ensures additional info not necessary' do
      subject.additional_info = nil
      expect(subject).to be_valid
    end

    it 'ensures portfolio present' do
      subject.portfolio_url = nil
      expect(subject).to_not be_valid
    end

    it 'ensures linkedin present' do
      subject.linkedin_url = nil
      expect(subject).to_not be_valid
    end

    it 'ensures current company can be blank' do
      subject.current_company = nil
      expect(subject).to be_valid
    end

    it 'should save succesfully' do
      expect(subject).to be_valid
    end

    it 'can belong to one applicant' do
      assc = described_class.reflect_on_association(:user)
      expect(assc.macro).to eq :belongs_to
    end

    it 'can belong to one job' do
      assc = described_class.reflect_on_association(:job)
      expect(assc.macro).to eq :belongs_to
    end

  end
end
