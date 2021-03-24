# Yash Dhayal
# CSC 415-02
# Assignment 2

# Framework/Skeleton/Prototype:

require 'spreadsheet'
require 'csv'   # 6 csv files within 2014_19_census_data folder. Data with overlays 
#require 'fusioncharts' # https://www.fusioncharts.com/blog/creating-charts-ruby-on-rails/

$DATA_SET = Array.new #2d array with rows and columns... or could be a hashmapped 2d array

#NEED TO LEARN GEM AND SEE IF PERMITTED. POTENTIALLY REASSIGN VALUES IN chart() method

=begin
@CHART = Fusioncharts::Chart.new({  #https://www.fusioncharts.com/blog/creating-charts-ruby-on-rails/
    :height => 1,
    :weight => 1,
    :id => 'chart',
    :type => '??',
    :renderAt => '??'
    :dataSource => '{ "chart": 
        {
            "caption": "Distribution of Races in Poverty",
            "subcaption": "Races",
            "paletteColors": "#2876DD,#0F283E",
            "decimals": "0",
            "numbersuffix": "%",
            "placevaluesinside": "0",
            "rotatevalues": "0",
            "divlinealpha": "50",
            "plotfillalpha": "80",
            "drawCrossLine": "1",
            "crossLineColor": "#F3F5F6",
            "crossLineAlpha": "80",
            "toolTipBgColor":"#ffffff",
            "toolTipColor":"#000000",
            "theme": "fint"
        },
        "categories": 
        [
            {"label1": " "},
            {"label2": " "}
            ...
        ]
    }'
})
=end


def scraper()#filename = File.new() OR no attrs )
    # scrape data from either downloaded file or site.

    #loop to clean and push into global array DATA_SET
end


def chart1(dataSet)
    # Chart for county selected
    # modify data in chart global variable
end


def chart2(dataSet) 
    # create another chart if needed
end


def map
    # create interactive map of NJ.
    # https://www.fusioncharts.com/dev/getting-started/ruby-on-rails/your-first-map-using-ruby-on-rails
    # The map will be using a still image of an NJ map with their counties bordered. You would click a county to get to their data

end

data2014 = CSV.read('2014_2019_census_data\ACSST5Y2014.S1701_data_with_overlays_2021-03-20T130441.csv')
data2015 = CSV.read('2014_2019_census_data\ACSST5Y2015.S1701_data_with_overlays_2021-03-20T130441.csv')
data2016 = CSV.read('2014_2019_census_data\ACSST5Y2016.S1701_data_with_overlays_2021-03-20T130441.csv')
data2017 = CSV.read('2014_2019_census_data\ACSST5Y2017.S1701_data_with_overlays_2021-03-20T130441.csv')
data2018 = CSV.read('2014_2019_census_data\ACSST5Y2018.S1701_data_with_overlays_2021-03-20T130441.csv')
data2019 = CSV.read('2014_2019_census_data\ACSST5Y2019.S1701_data_with_overlays_2021-03-20T130441.csv')

puts data2014[1][1]  #county name
puts data2014[1][18] #white
puts data2014[1][20] #black
puts data2014[1][22] #native american
puts data2014[1][24] #asian
puts data2014[1][26] #hawaiian or pacific islander
puts data2014[1][28] #other
puts data2014[1][32] #hispanic

data2014.each do |row|  #start at row 2 of csv file, since the other 2 are titles
    if row < 2
        next
    else
        