class CountyDataController

    def initialize
        counties_array = DataImporter.get_demographic_data_by_county
        CountyData.create_from_collection(counties_array)
    end

    def call
        puts "Welcome to the US Census County Level Demographic Data Library. The data here is from the 2018 American Community Survey 5 Year Data. There are over 3,000 counties in the United States. You might be thinking, wow that's a lot of counties, but you should also be thinking wow, that's a lot of data! Please be patient while the data is pulled from the API. This can take upwards of 30 seconds. I'm sure you're excited to explore some data, so let's jump in!!"
        puts ""
        puts "To find your county by its name, enter the number '1'"
        puts "To find all counties within a state, enter the number '2'"
        puts "To exit this program, enter 'exit'"

        input = ""
        until input == "exit"
            puts "What data would you like to explore?"
            input = gets.strip

            case input

            end
        end
        
    end


    def list_counties_by_state
        user_state = gets.chomp()
        user_state = user_state.split.collect{|w| w.capitalize}.join(" ")
        # if state = CountyData
        # CountyData.
    end
    
end