class Service < ApplicationRecord
  has_many :user_services
  has_many :users, through: :user_services

  def name
    Net::HTTP.get(URI("#{base_url}/name")) rescue 'N/A'
  end

  def description
    Net::HTTP.get(URI("#{base_url}/description")) rescue 'N/A'
  end

end
