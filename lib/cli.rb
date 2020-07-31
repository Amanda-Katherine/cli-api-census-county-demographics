class CountyDataController

    def initialize
        counties_array = DataImporter.get_demographic_data_by_county
        CountyData.create_from_collection(counties_array)
    end

    def welcome
        puts "\nWelcome to the US Census County Level Demographic and Housing Data Library. The data here is from the 2018 American Community Survey 5 Year."
        puts "Did you know there are over 3,000 counties in the United States?" 
        puts "I'm sure you're excited to explore some data, so let's jump in!!"
        puts " "
        self.get_input
    end

    def get_input
        state_input = ""
        until state_input == "exit"
            puts "To exit this program, enter 'exit'\n"
            puts "Please enter the state of the county you would like to look at:"
            state_input = gets.strip.split.collect{|w| w.capitalize}.join(" ")
        
            if state_input != "exit"
                self.list_counties(state_input)
            elsif state_input == ""
                self.get_input
            else
                exit
            end
        end
    end

    def list_counties(state_input)
        if CountyData.find_county_by_state(state_input) != nil
            # binding.pry
                CountyData.list_all_county_names_in_one_state(state_input).each_with_index do |county, index|
                    puts "#{index + 1}. #{county}"
                end # do
                self.select_county_input(state_input)
        else 
                puts "It does not appear that your entry was not a state. Please try again." 
                self.get_input
      
        end    
    end
    
    def select_county_input(state_input)
        # puts "Which data would you like to look at?"
        # puts "   Enter 'state' to see every counties data within the state."
        puts "   Enter the number of the county from the list above to see that county's data."
        # puts "   Enter 'other' if you would like to look at another state."
        
        county_input = gets.chomp.to_i    #will need to join the county name from this selection to the state name that was selected above.  Need to create a new method in county_data.rb to returns the county data for this joined object. 

        if (1..CountyData.list_all_county_names_in_one_state(state_input).length).include?(county_input)
            county = CountyData.list_all_county_names_in_one_state(state_input)[county_input - 1]
            county_data = CountyData.list_county_data(county)
            display_data(county_data)
        end
    end

    def display_data(county_data)
        puts "County Name: #{county_data.name}"
        puts "Total Population: #{county_data.tot_pop}"
        puts "Median Household Income: #{county_data.med_household_income}"
        puts "Total White Population: #{county_data.white_pop}"
        puts "Total Hispanic and Latino Population: #{county_data.hisp_lat_pop}"
        puts "Total Black Population: #{county_data.black_pop}"
        puts "Total Asian Population: #{county_data.asian_pop}"
        puts "Total Number of Population that is 2+ Races: #{county_data.tot_pop_two_plus_races}"
        puts "Total Number of Household Units: #{county_data.num_household_units}"
        puts "Number of Housing Units where the Owner Spends Less than 20% of their Monthly Costs on a Mortgage: #{county_data.num_units_using_less_than_20_percent_monthly_costs_for_mortgage}"
        puts "Number of Housing Units where the Owner Spends Between 20-24.9% of Monthly Costs on a Mortgage: #{county_data.num_units_using_20_25_percent_monthly_costs_for_mortgage}"
        puts "Number of Housing Units where the Owner Spends Between 25-29.9% of Monthly Costs on a Mortgage:#{county_data.num_units_using_25_30_percent_monthly_costs_for_mortgage}"
        puts "Number of Housing Units where the Owner Spends Between 30-34.9% of Monthly Costs on a Mortgage:#{county_data.num_units_using_30_35_percent_monthly_costs_for_mortgage}"
        puts "Number of Housing Units where the Owner Spends More than 35% of Monthly Costs on a Mortgage:#{county_data.num_units_using_35_plus_percent_monthly_costs_for_mortgage}"
        puts "Number of Households Utilizing SNAP and/or Food Stamp Services: #{county_data.tot_num_households_with_food_stamps_or_snap_benefits}"
    end

    
    
end