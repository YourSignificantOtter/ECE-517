# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
User.create(email: 'admin@tsys.com',password: '1qazxsw2',name: 'Admin I. Strator', company_id: nil, address: '123 NCSU Drive', city: 'Raleigh', state: 'NC', country: 'USA', phone_number: '555-555-5555')
#Seeding the Role table
[:admin, :recruiter, :job_seeker].each do |role|
  Role.where({ name: role }, without_protection: true).first_or_create
end

User.first.add_role(:admin)


#Test data
Company.destroy_all
Company.create!(name: "Company 1", headquarters: "Palo Alto, TX", website: "http://www.company.com", size: "1,000+", synopsis: "We do things for money", founded: 1999, industry: "Computer", revenue: "$100 million")

User.create!(email: 'recruiter@tsys.com',password: 'pass',name: 'First Recruiter', company_id: Company.find_by_name("Company 1").id, address: '123 NCSU Drive', city: 'Raleigh', state: 'NC', country: 'USA', phone_number: '555-555-5555')
User.find_by_email('recruiter@tsys.com').add_role(:recruiter)
User.create(email: 'job_seeker@tsys.com',password: 'pass',name: 'First Seeker', company_id: nil, address: '123 NCSU Drive', city: 'Raleigh', state: 'NC', country: 'USA', phone_number: '555-555-5555')
User.find_by_email('job_seeker@tsys.com').add_role(:job_seeker)
User.create(email: 'both@tsys.com',password: 'pass',name: 'Recruiter Seeker', company_id: Company.find_by_name("Company 1").id, address: '123 NCSU Drive', city: 'Raleigh', state: 'NC', country: 'USA', phone_number: '555-555-5555')
User.find_by_email('both@tsys.com').add_role(:job_seeker)
User.find_by_email('both@tsys.com').add_role(:recruiter)

Job.destroy_all
Job.create(job_title: "Worker 1", company_id: Company.find_by_name("Company 1").id, employment_type: "Full Time", job_description: "Do work for us", requirements: "Must be 6 feet tall", responsibilities: "Work hard", user_id: User.find_by_email('recruiter@tsys.com').id)