# Demographic County Data CLI from the US Census
This is a CLI application that pulls data from the US Census' API.  The data within this project are from the American Community Survey 5 Year Set.  

The user is able to select any county within the US they want to see data from.  The data will show information on that county's 


## Getting Started

    In order to run this program, you will need a private API key from the US Census API.  You can obtain a key here: https://api.census.gov/data/key_signup.html. Once your key is created you will be able to use the US Census API, so head on over https://www.census.gov/data/developers/guidance/api-user-guide.html.

### Installation

To run this application in your local environment, do the following:

1. Clone this repository
2. In your terminal, cd into the proper directory: `/yourdirectory/cli-api-census-county-demographics`
3. Run `bundle install`
4. Run `bin/run` 
    -Note: If that doesn't work or you don't have the right perimssion to run the program, try run `ruby bin/run`

## Sample

```
********************************************************************

Welcome to the US Census County Data Finder. The data here is from the 2018 American Community Survey 5 Year and represents a portion of demographic and housing data that the ACS collects.

Did you know there are over 3,000 counties in the United States?

I'm sure you're excited to explore some data, so let's jump in!!

********************************************************************

Please enter the state of the county you would like to look at or enter 'exit' to leave this program:

Selection: Rhode Island

1. Bristol County, Rhode Island
2. Kent County, Rhode Island
3. Newport County, Rhode Island
4. Providence County, Rhode Island
5. Washington County, Rhode Island


Enter the number of the county from the list above to see that county's data.
Selection: 5

**************************************************************************************************************
County Name: Washington County, Rhode Island
Median Household Income: 81301
Total Population: 126242
Total White Population: 117380
Total Hispanic and Latino Population: 3914
Total Black Population: 1779
Total Asian Population: 2427
Total Number of Population that is 2+ Races: 2184
Total Number of Household Units: 25130
Number of Housing Units where the Owner Spends Less than 20% of their Monthly Costs on a Mortgage: 10270
Number of Housing Units where the Owner Spends Between 20-24.9% of Monthly Costs on a Mortgage: 4166
Number of Housing Units where the Owner Spends Between 25-29.9% of Monthly Costs on a Mortgage: 3222
Number of Housing Units where the Owner Spends Between 30-34.9% of Monthly Costs on a Mortgage: 2061
Number of Housing Units where the Owner Spends More than 35% of Monthly Costs on a Mortgage: 5411
Number of Households Utilizing SNAP and/or Food Stamp Services: 3663
**************************************************************************************************************

If you would like to go back to the Rhode Island county list, enter 'list'.
If you would like to look at a county in another state, enter that state's name.
If you would like to go to exit the program, enter 'exit'
Selection: exit

*********************************************************************
  Thanks for checking out the County Data Finder. Have a great day!
*********************************************************************
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Amanda-Katherine/cli-api-census-county-demographics. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.

## Authors

* **Amanda Walker** - [Amanda Walker](https://github.com/Amanda-Katherine)

## License

This project is licensed under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Acknowledgments

Thanks so much to the US Census for continuing to offer their API free of charge. 