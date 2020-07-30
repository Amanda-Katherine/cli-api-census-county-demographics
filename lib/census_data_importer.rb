require 'open-uri'
require 'nokogiri'
require 'httparty'
require 'net/http'
require 'json'
require 'pry'

class DataImporter
    # include HTTParty
    
    @@api_key = "0c47ebad1cc342bbf5eeb2ef26ede29c97ccb260"

       #full url: "https://api.census.gov/data/2018/acs/acs5/profile?get=NAME,DP05_0001E,DP05_0018E,DP03_0062E,DP05_0037E,DP05_0070E,DP05_0038E,DP05_0044E,DP05_0035E,DP04_0110E,DP04_0111E,DP04_0112E,DP04_0113E,DP04_0114E,DP04_0115E,DP03_0074E&for=county:*&in=state:*&key=0c47ebad1cc342bbf5eeb2ef26ede29c97ccb260"

    # def self.import_list_of_counties_for_cli
    #     url = "https://api.census.gov/data/2018/acs/acs5/profile?get=NAME&for=county:*&in=state:*"

    #     all_counties = HTTParty.get(url).parsed_response
    #     response = all_counties.delete_at(0)
    #     response
    # end

    def self.import_county_data_from_api
        url = "https://api.census.gov/data/2018/acs/acs5/profile?get=NAME,DP05_0001E,DP05_0018E,DP03_0062E,DP05_0037E,DP05_0070E,DP05_0038E,DP05_0044E,DP05_0035E,DP04_0110E,DP04_0111E,DP04_0112E,DP04_0113E,DP04_0114E,DP04_0115E,DP03_0074E&for=county:*&in=state:*&key=#{@@api_key}"

        response = HTTParty.get(url).parsed_response
        response.shift
        response
    end
        
    def self.get_demographic_data_by_county
        
        import_county_data_from_api.collect do |county_data|
            county_hash = {
                :name => county_data[0], 
                :tot_pop => county_data[1],
                :median_age => county_data[2], 
                :med_household_income => county_data[3], 
                :white_pop => county_data[4], 
                :hisp_lat_pop => county_data[5], 
                :black_pop => county_data[6], 
                :asian_pop => county_data[7], 
                :tot_pop_two_plus_races => county_data[8], 
                :num_household_units => county_data[9], 
                :num_units_using_less_than_20_percent_monthly_costs_for_mortgage => county_data[10], 
                :num_units_using_20_25_percent_monthly_costs_for_mortgage => county_data[11], 
                :num_units_using_25_30_percent_monthly_costs_for_mortgage => county_data[12], 
                :num_units_using_30_35_percent_monthly_costs_for_mortgage => county_data[13], 
                :num_units_using_35_plus_percent_monthly_costs_for_mortgage => county_data[14], 
                :tot_num_households_with_food_stamps_or_snap_benefits => county_data[15],
                :state_num => county_data[16],
                :county_num => county_data[17]
            }
        end
    end
end

