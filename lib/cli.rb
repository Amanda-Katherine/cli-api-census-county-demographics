class CountyDataController

    def initialize
        counties_array = DataImporter.get_demographic_data_by_county
        collection = CountyData.create_from_collection(counties_array)
    end

    def welcome
        puts "Welcome to the US Census County Level Demographic Data Library. The data here is from the 2018 American Community Survey 5 Year Data. There are over 3,000 counties in the United States. You might be thinking, wow that's a lot of counties, but you should also be thinking wow, that's a lot of data! Please be patient while the data is pulled from the API. This can take upwards of 30 seconds. I'm sure you're excited to explore some data, so let's jump in!!"
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
            elsif state_input = ""
                self.get_input
            else
            end
        end
    end
    
    
    
    def list_counties(state_input)
        if CountyData.find_county_by_state(state_input) != nil
            if CountyData.list_all_county_names_in_one_state(state_input).include?(self)   #question here
                CountyData.list_all_county_names_in_one_state(state_input).sort do |a,b|  #do I need the do to end section or can I take this out? 
                    a.name <=> b.name
                end.each_with_index do |county, index|
                    puts "#{index + 1}. #{county.name}"
                    self.select_county_to_get_data
                end # do
            else 
                puts "It does not appear that your entry was not a state. Please try again." 
                self.get_input
            end #if
        end    
    end
    
    def self.select_county_input
        # puts "Which data would you like to look at?"
        # puts "   Enter 'state' to see every counties data within the state."
        puts "   Enter the number of the county from the list above to see that county's data."
        # puts "   Enter 'other' if you would like to look at another state."
        
        county_input = gets.chomp.to_i    #wiln need to join the county name from this selection to the state name that was selected above.  Need to create a new method in county_data.rb to returns the county data for this joined object. 

        if (1..CountyData.list_all_county_names_in_one_state(state_input).length).include?(county_input)
            county = 
        end
    end
end