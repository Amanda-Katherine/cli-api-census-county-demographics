class CLI

    #do I need to initialize this class? 

    def run
        self.list_counties_by_state
    end

    def make_counties
        counties_array = DataImporter.get_demographic_data_by_county
        CountyData.create_from_collection(counties_array)
        #how do I not return anything here, but just have this data accessible in the background of the program?  I guess I don't call it until I need it via another method? 
    end

    def list_counties_by_state(user_state)
        user_state = gets.chomp().capitalize
        if state = CountyData
        CountyData.
    end
    
end