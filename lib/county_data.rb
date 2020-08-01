class CountyData
    attr_accessor :name, :tot_pop, :median_age, :med_household_income, :white_pop, :hisp_lat_pop, :black_pop, :asian_pop, :tot_pop_two_plus_races, :num_household_units, :num_units_using_less_than_20_percent_monthly_costs_for_mortgage, :num_units_using_20_25_percent_monthly_costs_for_mortgage, :num_units_using_25_30_percent_monthly_costs_for_mortgage, :num_units_using_30_35_percent_monthly_costs_for_mortgage, :num_units_using_35_plus_percent_monthly_costs_for_mortgage, :tot_num_households_with_food_stamps_or_snap_benefits, :state_num, :county_num

    @@all = [ ]
    
    def self.create_from_collection(counties_array)
        counties_array.each {|county_hash| CountyData.new(county_hash)}  #iterates through the API's collected data array and ensures every county's hash is initialized.
    end

    def initialize(county_hash)
        county_hash.each {|k, v| self.send("#{k}=", v)}
        @@all << self #iterates through each county hash and creates the key/value pairs from the attributes listed above and puts them in the class variable @@all. 
    end


    def self.all
        @@all #allows stored county data to be accessible outside this class. 
    end

    
    def self.list_all_states
        self.all.collect {|name_of_state| name_of_state.name.split(", ")[1].split(" ").collect{|w| w.capitalize}.join(" ")}.uniq.sort #returns an array of all US States and formats the state names to capitalize the first letter
    end
    
    def self.list_county_data(county_name) 
        CountyData.all.detect{|county_data| county_data.name.downcase == county_name.downcase} #will return the county data of the county that matches the county_name user input. Note that here the county_name input includes the state name as well. 
    end
    
    def self.list_all_county_names_in_one_state(state_name)
        self.find_county_by_state(state_name).collect {|county_name| county_name.name}.sort  #returns an array of all the county names that are contained within the state that matches state_name.
    end
    
    def self.find_county_by_state(state_name = nil)
        if state_name != nil
            state_name = state_name.split.collect{|w| w.capitalize}.join(" ") #makes first letter of each word capitalized from user input

            self.all.select {|state| state.name.split(", ")[1].split(" ").collect{|w| w.capitalize}.join(" ") == state_name} #finds if the user input state_name == at least one formatted state name from API data. 
        end
    end
    

    
    ## The below are two additional functioning methods that will add the functionality to look by county name from the start. 

    # def self.list_all_counties_with_same_name(county_name)
    #     self.find_by_county_name_all_variables(county_name).collect {|county_name| county_name.name}
    # end

    # def self.find_by_county_name_all_variables(county_name)
    #     county_name = county_name.split.collect{|w| w.capitalize}.join(" ")
    #     self.all.select {|county| county.name.split(", ")[0].split(" ").collect{|w| w.capitalize}.join(" ") == county_name}    
    # end 
end 