class CountyData
    attr_accessor :name, :tot_pop, :median_age, :med_household_income, :white_pop, :hisp_lat_pop, :black_pop, :asian_pop, :tot_pop_two_plus_races, :num_household_units, :num_units_using_less_than_20_percent_monthly_costs_for_mortgage, :num_units_using_20_25_percent_monthly_costs_for_mortgage, :num_units_using_25_30_percent_monthly_costs_for_mortgage, :num_units_using_30_35_percent_monthly_costs_for_mortgage, :num_units_using_35_plus_percent_monthly_costs_for_mortgage, :tot_num_households_with_food_stamps_or_snap_benefits, :state_num, :county_num

    @@all = [ ]

    def initialize(county_hash)
        county_hash.each {|k, v| self.send("#{k}=", v)}
        @@all << self
    end

    def self.create_from_collection(county_array)
        students_array.each {|county_hash| CountyData.new(county_hash)}
    end

    def self.all
        @@all 
    end
  
end