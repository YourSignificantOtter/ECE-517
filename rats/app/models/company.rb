class Company < ApplicationRecord
  validates :name, presence: true
  validates_uniqueness_of :name, :case_sensitive => false
  validates :website, presence: true, format: {with: /\Ahttps?:\/\/www.[a-zA-Z0-9]{3,}.[a-zA-z0-9]{2,3}\Z/, message:
      'Must be of the form http(s)://www.website.com/org/etc'}
  validates :headquarters, presence: true
  validates :founded, presence: true, numericality: { only_integer: true, less_than_or_equal_to: Time.now.year }
  validates :industry, presence: true
  validates :revenue, presence: true, format: {with: /\A\$(\d+|\d+\.\d{2})\s(thousand|million|billion)\Z/i, message:
      'Must be of the form "$Value [thousand|million|billion]".'}
  validates :synopsis, presence: true
end
