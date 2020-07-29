class CountyData
    attr_accessor :name, :tot_pop, :median_age, :med_household_income, :white_pop, :hisp_lat_pop, :black_pop, :asian_pop, :tot_pop_two_plus_races, :num_household_units, :num_units_using_less_than_20_percent_monthly_costs_for_mortgage, :num_units_using_20_25_percent_monthly_costs_for_mortgage, :num_units_using_25_30_percent_monthly_costs_for_mortgage, :num_units_using_30_35_percent_monthly_costs_for_mortgage, :num_units_using_35_plus_percent_monthly_costs_for_mortgage, :tot_num_households_with_food_stamps_or_snap_benefits, :state_num, :county_num

    @@all = [ ]

    def initialize(county_hash)
        county_hash.each {|k, v| self.send("#{k}=", v)}
        @@all << self
    end

    def self.create_from_collection(counties_array)
        students_array.each {|county_hash| CountyData.new(county_hash)}
    end

    def self.all
        @@all 
    end

    def self.find_by_state_name(state_name)
        self.all.find {|state| state.name.split(",")[1] == state_name
            #will this type of method work? or would I need to do something more similar to this?
            #state.name.split(",").collect{|w| w.capitalize}.join(" ")
    end
   
    def self.find_by_county_name(county_name)
        self.all.find {|county| county.name.split(",")[0] == county_name    
            
            
            #if I ask a user directly for their county, and there multiple counties with that name, should I just list the counties and states in the CLI and then have them choose from there? 
    end
    
end
# county_hash = {:name=>"Worcester County, Maryland",
#     :tot_pop=>"51564",
#     :median_age=>"50.1",
#     :med_household_income=>"61145",  
#     :white_pop=>"42778",
#     :hisp_lat_pop=>"51564",
#     :black_pop=>"6754",
#     :asian_pop=>"685",
#     :tot_pop_two_plus_races=>"1042",
#     :num_household_units=>"9519",
#     :num_units_using_less_than_20_percent_monthly_costs_for_mortgage=>"3421",
#     :num_units_using_20_25_percent_monthly_costs_for_mortgage=>"1264",
#     :num_units_using_25_30_percent_monthly_costs_for_mortgage=>"1090",
#     :num_units_using_30_35_percent_monthly_costs_for_mortgage=>"876",
#     :num_units_using_35_plus_percent_monthly_costs_for_mortgage=>"2868",
#     :tot_num_households_with_food_stamps_or_snap_benefits=>"2218",
#     :state_num=>"24",
#     :county_num=>"047"
# }
worcester = CountyData.find_by_state_name({:name=>"Worcester County, Maryland",
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
    :county_num=>"047"
})
    
binding.pry