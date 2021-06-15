require 'rest-client'
require 'json'
require 'awesome_print'
require 'pry'

class CowinVaccine
  DISTRICT_LIST_URL = "https://cdn-api.co-vin.in/api/v2/admin/location/districts/state_id"
  VACCINE_BY_DISTRICT_URL = "https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/calendarByDistrict"

  attr_reader :state_id, :dose, :age, :vaccines, :date_range, :districts, :availability

  def initialize(opts={})
    @state_id = (opts[:state_id] || 32).to_s
    @dose = opts[:dose] || 1
    @age = opts[:age] || 18
    @vaccines = opts[:vaccines] || ['COVISHIELD', 'COVAXIN']
    @districts = api_get(DISTRICT_LIST_URL.gsub("state_id", state_id)).dig("districts")
    @availability = {}
  end

  def fetch_vaccines
    districts.each_with_index do |district, district_index|
      centers = api_get("#{VACCINE_BY_DISTRICT_URL}?district_id=#{district['district_id']}&date=#{Date.today.strftime('%d-%m-%Y')}").dig('centers')
      centers.each_with_index do |center, center_index|
        availability[district['district_name']] = {} unless availability[district['district_name']]
        center['sessions']&.each do |session|
          availability[district['district_name']][center['name']] = [] unless availability[district['district_name']][center['name']]
          if session["available_capacity_dose#{dose}"].positive? && vaccines.any? { |v| session['vaccine'] == v } && session['min_age_limit'] == age
            availability[district['district_name']][center['name']] << { 
              "#{session['date']}" => "D#{dose} #{session['min_age_limit']}+ #{session['vaccine']} #{center['fee_type']} #{center['vaccine_fees']&.find {|fee| fee['vaccine'] == session['vaccine'] }&.dig('fee')} - #{session['available_capacity_dose' + dose.to_s]}"
            }
          end
        end
        availability[district['district_name']].delete(center['name']) if availability[district['district_name']][center['name']].empty?
      end
      availability.delete(district['district_name']) if availability[district['district_name']] && availability[district['district_name']].empty?
    end
  end

private
  def api_get(url)
    headers = {
      'Content-Type': 'application/json', 
      'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36'
    }
    begin
      JSON.parse(RestClient.get(url, headers))
    rescue => e
      p e
      {}
    end
  end
end

cv = CowinVaccine.new(state_id: 21, dose: 1, age: 18, vaccines: ['COVAXIN'])
cv.fetch_vaccines
ap cv.availability