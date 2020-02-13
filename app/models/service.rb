class Service < ApplicationRecord
  has_many :user_services
  has_many :users, through: :user_services

  validates :base_url, presence: {message: '%{attribute} cannot be empty'}, uniqueness: {message: '%{value} has already been taken'}

  def name
    Net::HTTP.get(URI("#{base_url}/name")) rescue 'N/A'
  end

  def description
    Net::HTTP.get(URI("#{base_url}/description")) rescue 'N/A'
  end

end
