require 'open-uri'
require 'nokogiri'
require 'httparty'

class DataImporter
    # include HTTParty
    
    @@variables_hash_2009 = {
        "NAME": name,
        "DP05_0001E": population,
        "DP05_0017E": median_age,
        "DP03_0063E": median_household_income,
        "DP05_0032E": white_pop,
        "DP05_0065E": hisp_latino_pop,
        "DP05_0033E": black_pop,
        "DP05_0039E": asian_pop,
        "DP05_0030E": two_or_more_races_pop,
        "DP04_0108E": total_num_household_units,
        "DP04_0109E": less_than_20_percent_income_per_month,
        "DP04_0110E": btw_20_and_24_9_percent_income_per_month,
        "DP04_0111E": btw_25_and_29_9_percent_income_per_month,
        "DP04_0112E": btw_30_and_34_9_percent_income_per_month,
        "DP04_0113E": 35_pecent_or_more_percent_income_per_month,
        "DP03_0075E": num_households_with_SNAP_food_stamp
    }

    @@variables_hash_2013 = {
        "NAME": name,
        "DP05_0001E": population,
        "DP05_0017E": median_age,
        "DP03_0062E": median_household_income,
        "DP05_0032E": white_pop,
        "DP05_0065E": hisp_latino_pop,
        "DP05_0033E": black_pop,
        "DP05_0039E": asian_pop,
        "DP05_0030E": two_or_more_races_pop,
        "DP04_0108E": total_num_household_units,
        "DP04_0109E": less_than_20_percent_income_per_month,
        "DP04_0110E": btw_20_and_24_9_percent_income_per_month,
        "DP04_0111E": btw_25_and_29_9_percent_income_per_month,
        "DP04_0112E": btw_30_and_34_9_percent_income_per_month,
        "DP04_0113E": 35_pecent_or_more_percent_income_per_month,
        "DP03_0074E": num_households_with_SNAP_food_stamp
    }


    @@ variables_hash_2018 = {}
    
end