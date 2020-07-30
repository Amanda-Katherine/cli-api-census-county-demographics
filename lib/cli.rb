class CountyDataController

    def initialize
        counties_array = DataImporter.get_demographic_data_by_county
        CountyData.create_from_collection(counties_array)
    end

    def welcome
        puts "Welcome to the US Census County Level Demographic Data Library. The data here is from the 2018 American Community Survey 5 Year Data. There are over 3,000 counties in the United States. You might be thinking, wow that's a lot of counties, but you should also be thinking wow, that's a lot of data! Please be patient while the data is pulled from the API. This can take upwards of 30 seconds. I'm sure you're excited to explore some data, so let's jump in!!"
    end

    def get_input
        puts "To exit this program, enter 'exit'"
        input = ""
        until input == "exit"
            puts "What state is your county in?"
            input = gets.strip.split.collect{|w| w.capitalize}.join(" ")

            if CountyData.find_county_by_state(input) != nil
                list_counties(input)
            else
                puts "It looks like you did not enter a state.   
                  self.get_input
            end
        end
        
    end


    # def list_counties(input)
        
    # end
    
end