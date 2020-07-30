class CountyDataController

    def initialize
        counties_array = DataImporter.get_demographic_data_by_county
        CountyData.create_from_collection(counties_array)
    end

    def welcome
        puts "\nWelcome to the US Census County Level Demographic Data Library. The data here is from the 2018 American Community Survey 5 Year Data. There are over 3,000 counties in the United States. You might be thinking, wow that's a lot of counties, but you should also be thinking wow, that's a lot of data! Please be patient while the data is pulled from the API. This can take upwards of 30 seconds. I'm sure you're excited to explore some data, so let's jump in!!"
        puts " "
        puts "To exit this program, enter 'exit'"
        self.get_input
    end

    def get_input
        state_input = ""
        until state_input == "exit"
            puts "What state is your county in?"
            state_input = gets.strip.split.collect{|w| w.capitalize}.join(" ")
        
            if state_input != "exit"
                self.list_counties(state_input)
            elsif state_input == ""
                self.get_input
            else
            end
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
            binding.pry
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
    
end