class CountyDataController

    def initialize
        counties_array = DataImporter.get_demographic_data_by_county
        CountyData.create_from_collection(counties_array)
    end

    def welcome
        system('clear')
        puts "\n*********************************************************************".colorize(:light_black)
        puts "            Welcome to the US Census County Data Finder".colorize(:cyan) 
        puts "*********************************************************************".colorize(:light_black)
        sleep(2)
        puts "\nThe data here are from the 2018 American Community Survey 5 Year \ndata set. It represents a portion of demographic and housing data \nthat the ACS collects."
        puts "\nDid you know there are over " + "3,000 counties".colorize(:light_cyan) + " in the United States?" 
        puts "\nI'm sure you're excited to explore some data, so let's jump in!! 💻" 
        puts "\n********************************************************************".colorize(:light_black)
        sleep(2)
        self.get_input
    end

    def get_input(state_input = "")  
        until state_input == "Exit"
            puts "\nPlease enter the " + "state".colorize(:cyan) + " of the county you would like to look at or \nenter " + "'exit'".colorize(:red) + " to leave this program:\n\n"
            print "Selection: "

            state_input = gets.strip.split.collect{|w| w.capitalize}.join(" ")
            @state_input = state_input
            
            if state_input == "Exit"
                system('clear')
                abort "\n\n\n          *********************************************************************\n".colorize(:light_black) + "          Thanks for checking out the County Data Finder. Have a great day! 😊\n".colorize(:cyan) + "          *********************************************************************\n\n\n\n".colorize(:light_black)
            else 
                self.check_state_validity(state_input)
            end
        end
    end

    def check_state_validity(state_input)
        
        if CountyData.find_county_by_state(state_input) == [] 
                puts "\n*********************************************************************\n".colorize(:light_black)

                CountyData.list_all_states.each  {|state| puts "#{state}"}
            
                puts "\nIt does not appear that your entry was valid. Check out the list above for valid options.".colorize(:red) 
        
                self.get_input
        else
            self.list_counties(state_input)
        end
    end

    def list_counties(state_input)
        puts "\n"
        CountyData.list_all_county_names_in_one_state(state_input).each_with_index do |county, index|
            puts "#{index + 1}. #{county}"
        end 
        
        self.select_county_input(state_input)   
    end
    
    def select_county_input(state_input)
        puts "\n\nEnter the " + "number".colorize(:cyan) + " of the county from the list above to see that county's data."
        print "Selection: "

        county_input = gets.chomp.to_i

        if (1..CountyData.list_all_county_names_in_one_state(state_input).length).include?(county_input)
            county = CountyData.list_all_county_names_in_one_state(state_input)[county_input - 1]
            county_data = CountyData.list_county_data(county)
            
            display_data(county_data)
        else
            puts "\nWhoops. Looks like you didn't select a valid number".colorize(:red)
            self.select_county_input(state_input)
        end
    end

    def display_data(county_data)
        puts "\n**************************************************************************************************************\n".colorize(:light_black)
        puts "County Name: ".colorize(:light_cyan) + "#{county_data.name}"
        puts "Median Household Income:".colorize(:light_cyan) + " #{county_data.med_household_income}"
        puts "Total Population:".colorize(:light_cyan) + " #{county_data.tot_pop}"
        puts "Total White Population:".colorize(:light_cyan) + " #{county_data.white_pop}"
        puts "Total Hispanic and Latino Population:".colorize(:light_cyan) + " #{county_data.hisp_lat_pop}"
        puts "Total Black Population:".colorize(:light_cyan) + " #{county_data.black_pop}"
        puts "Total Asian Population:".colorize(:light_cyan) + " #{county_data.asian_pop}"
        puts "Total Number of Population that is 2+ Races:".colorize(:light_cyan) + " #{county_data.tot_pop_two_plus_races}"
        puts "Total Number of Household Units:".colorize(:light_cyan) + " #{county_data.num_household_units}"
        puts "Number of Housing Units where the Owner Spends Less than 20% of their Monthly Costs on a Mortgage:".colorize(:light_cyan) + " #{county_data.num_units_using_less_than_20_percent_monthly_costs_for_mortgage}"
        puts "Number of Housing Units where the Owner Spends Between 20-24.9% of Monthly Costs on a Mortgage:".colorize(:light_cyan) + " #{county_data.num_units_using_20_25_percent_monthly_costs_for_mortgage}"
        puts "Number of Housing Units where the Owner Spends Between 25-29.9% of Monthly Costs on a Mortgage:".colorize(:light_cyan) + " #{county_data.num_units_using_25_30_percent_monthly_costs_for_mortgage}"
        puts "Number of Housing Units where the Owner Spends Between 30-34.9% of Monthly Costs on a Mortgage:".colorize(:light_cyan) + " #{county_data.num_units_using_30_35_percent_monthly_costs_for_mortgage}"
        puts "Number of Housing Units where the Owner Spends More than 35% of Monthly Costs on a Mortgage:".colorize(:light_cyan) + " #{county_data.num_units_using_35_plus_percent_monthly_costs_for_mortgage}"
        puts "Number of Households Utilizing SNAP and/or Food Stamp Services:".colorize(:light_cyan) + " #{county_data.tot_num_households_with_food_stamps_or_snap_benefits}"
        puts "\n**************************************************************************************************************".colorize(:light_black)

        self.post_county_user_choice
    end

    def post_county_user_choice
        puts "\nIf you would like to go back to the #{@state_input} county list, enter " + "'list'.".colorize(:light_blue)
        puts "If you would like to look at a county in another state, enter that " + "state's name.".colorize(:light_blue)
        puts "If you would like to go to exit the program, enter " + "'exit'\n".colorize(:red)
        print "Selection: "
        post_county_input = gets.chomp.downcase

        case post_county_input
        when 'list'
            self.list_counties(@state_input)
        when 'exit'
            system('clear')
            abort "\n\n\n          *********************************************************************\n".colorize(:light_black) + "          Thanks for checking out the County Data Finder. Have a great day! 😊\n".colorize(:cyan) + "          *********************************************************************\n\n\n\n".colorize(:light_black)
        else
            state_input = post_county_input.split.collect{|w| w.capitalize}.join(" ")
            
            if CountyData.list_all_states.any?(state_input)
                @state_input = state_input
                self.list_counties(state_input) 
            else 
                self.post_county_user_choice
            end
        end
    end 
end
