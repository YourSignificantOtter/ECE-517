require 'bcrypt'

class User < ApplicationRecord
  has_many :applications, dependent: :destroy
  include BCrypt, UsersHelper

  rolify

  has_secure_password

  validates :email, presence: true, format: {with: /\A\S+@\S+\.\S{2,3}\Z/i, message:
      'Email not properly formatted'}, on: :create #this regex can be improved a lot
  validates :password, presence: true, on: :create
  validates :password, confirmation: { case_sensitive: true}, on: :create

  validates :name, presence: true, on: :update
  validates :address, presence: true, format: {with: /\A(\d+\s[a-z]+\s[a-z]+|\d+\s\d+\s[a-z]+\s[a-z]+)\Z/i,
      message: 'must be in the form of HouseNumber (ApartmentNumber) StreetName StreetType'}, on: :update
  validates :city, presence: true, format: {with: /\A[a-z]+\Z/i}, on: :update
  #validates :state, presence: true, format: {with: /\A[A-Z]{2}\Z/, message: 'Please use state acronyms'}, on: :update
  validates :country, presence: true, format: {with: /\A([a-z]+\s?)*\Z/i}, on: :update
  validates :phone_number, presence: true, format: {with: /\A\d{3}[\s|-]\d{3}[\s|-]\d{4}\Z/,
      message: 'must be in the form of XXX-XXX-XXXX or XXX XXX XXXX'}, on: :update

  def company_name
    return '' if !Company.exists? company_id
    Company.find(company_id).name
  end

  def self.unlink_recruiters(company)
    @users = User.all.select {|j| j.company_id == company.id}
    if @users
      if @users.respond_to?(:each)
        @users.each do |j|
          j.company_id = nil
          j.save
        end
      else
        @users.company_id = nil
        @users.save
      end
    end
  end

  def password
    @password ||= Password.new(self.password_digest)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end
end
