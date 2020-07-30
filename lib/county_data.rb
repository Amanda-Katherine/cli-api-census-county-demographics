require 'pry'

class CountyData
    attr_accessor :name, :tot_pop, :median_age, :med_household_income, :white_pop, :hisp_lat_pop, :black_pop, :asian_pop, :tot_pop_two_plus_races, :num_household_units, :num_units_using_less_than_20_percent_monthly_costs_for_mortgage, :num_units_using_20_25_percent_monthly_costs_for_mortgage, :num_units_using_25_30_percent_monthly_costs_for_mortgage, :num_units_using_30_35_percent_monthly_costs_for_mortgage, :num_units_using_35_plus_percent_monthly_costs_for_mortgage, :tot_num_households_with_food_stamps_or_snap_benefits, :state_num, :county_num

    @@all = [ ]

    def initialize(county_hash)
        county_hash.each {|k, v| self.send("#{k}=", v)}
        @@all << self
    end

    def self.create_from_collection(counties_array)
        counties_array.each {|county_hash| CountyData.new(county_hash)}
    end

    def self.all
        @@all 
    end
    #will this type of method work? or would I need to do something more similar to this?
    #state.name.split(",").collect{|w| w.capitalize}.join(" ")

    def self.find_county_by_state(state_name)
        state_name = state_name.split.collect{|w| w.capitalize}.join(" ")
        self.all.select {|state| state.name.split(", ")[1] == state_name}
    end
   
    def self.find_by_county_name(county_name)
        county_name = county_name.split.collect{|w| w.capitalize}.join(" ")
        self.all.select {|county| county.name.split(", ")[0].split(" ").collect{|w| w.capitalize}.join(" ") == county_name}    
    end
        #if I ask a user directly for their county, and there multiple counties with that name, should I just list the counties and states in the CLI and then have them choose from there? 
    
end #Worcester County, Maryland
counties_array = [{:name=>"Baltimore city, Rhode Island",
    :tot_pop=>"51564",
    :median_age=>"50.1",
    :med_household_income=>"61145",
    :white_pop=>"42778",   
    :hisp_lat_pop=>"51564",
    :black_pop=>"6754",    
    :asian_pop=>"685",     
    :tot_pop_two_plus_races=>"1042",
    :num_household_units=>"9519",
    :num_units_using_less_than_20_percent_monthly_costs_for_mortgage=>"3421",
    :num_units_using_20_25_percent_monthly_costs_for_mortgage=>"1264",
    :num_units_using_25_30_percent_monthly_costs_for_mortgage=>"1090",
    :num_units_using_30_35_percent_monthly_costs_for_mortgage=>"876",
    :num_units_using_35_plus_percent_monthly_costs_for_mortgage=>"2868",
    :tot_num_households_with_food_stamps_or_snap_benefits=>"2218",
    :state_num=>"24",
    :county_num=>"047"},
   {:name=>"baltimore COUNTY, Maryland",
    :tot_pop=>"614700",
    :median_age=>"35.1",
    :med_household_income=>"48840",
    :white_pop=>"187152",
    :hisp_lat_pop=>"614700",
    :black_pop=>"383918",
    :asian_pop=>"15898",
    :tot_pop_two_plus_races=>"15325",
    :num_household_units=>"76658",
    :num_units_using_less_than_20_percent_monthly_costs_for_mortgage=>"32082",
    :num_units_using_20_25_percent_monthly_costs_for_mortgage=>"11071",
    :num_units_using_25_30_percent_monthly_costs_for_mortgage=>"7764",
    :num_units_using_30_35_percent_monthly_costs_for_mortgage=>"5754",
    :num_units_using_35_plus_percent_monthly_costs_for_mortgage=>"19987",
    :tot_num_households_with_food_stamps_or_snap_benefits=>"58388",
    :state_num=>"24",
    :county_num=>"510"}]
baltimore = CountyData.create_from_collection(counties_array)

baltimore_state = CountyData.find_county_by_state("Maryland")

baltimore_county = CountyData.find_by_county_name("Baltimore")
    
# binding.pry