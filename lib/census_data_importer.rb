require 'open-uri'
require 'nokogiri'
require 'httparty'
require 'net/http'
require 'json'

class DataImporter
    # include HTTParty
    
    @@api_key = "0c47ebad1cc342bbf5eeb2ef26ede29c97ccb260"

    @@url = "https://api.census.gov/data/2018/acs/acs5/profile?get=NAME,DP05_0001E,DP05_0018E,DP03_0062E,DP05_0037E,DP05_0070E,DP05_0038E,DP05_0044E,DP05_0035E,DP04_0110E,DP04_0111E,DP04_0112E,DP04_0113E,DP04_0114E,DP04_0115E,DP03_0074E&for=county:*&in=state:*&key=#{api_key}"

    #full url: "https://api.census.gov/data/2018/acs/acs5/profile?get=NAME,DP05_0001E,DP05_0018E,DP03_0062E,DP05_0037E,DP05_0070E,DP05_0038E,DP05_0044E,DP05_0035E,DP04_0110E,DP04_0111E,DP04_0112E,DP04_0113E,DP04_0114E,DP04_0115E,DP03_0074E&for=county:*&in=state:*&key=0c47ebad1cc342bbf5eeb2ef26ede29c97ccb260"
    
    @@ variables_hash_2018 = {
        "NAME": name,
        "DP05_0001E": population,
        "DP05_0018E": median_age,
        "DP03_0062E": median_household_income,
        "DP05_0037E": white_pop,
        "DP05_0070E": hisp_latino_pop,
        "DP05_0038E": black_pop,
        "DP05_0044E": asian_pop,
        "DP05_0035E": two_or_more_races_pop,
        "DP04_0110E": total_num_household_units,
        "DP04_0111E": less_than_20_percent_income_per_month,
        "DP04_0112E": btw_20_and_24_9_percent_income_per_month,
        "DP04_0113E": btw_25_and_29_9_percent_income_per_month,
        "DP04_0114E": btw_30_and_34_9_percent_income_per_month,
        "DP04_0115E": 35_pecent_or_more_percent_income_per_month,
        "DP03_0074E": num_households_with_SNAP_food_stamp
    }

    def self.get_demographic_data_by_county
        response = HTTParty.get(@@url).parsed_response
    end
    
end