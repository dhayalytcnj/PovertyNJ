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



def scraper(filename)
    # scrape data from either downloaded file or site.
    #loop to clean and push into global array DATA_SET

    #datafile = File.read()
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
=end

#data2014 = CSV.read('2014_2019_census_data\ACSST5Y2014.S1701-2021-03-24T223501.xls', :quote_char => "|")
data2015 = CSV.read('2014_2019_census_data\ACSST5Y2015.S1701-2021-03-24T223430.csv', :quote_char => "|")
data2016 = CSV.read('2014_2019_census_data\ACSST5Y2016.S1701-2021-03-24T223412.csv', :quote_char => "|")
data2017 = CSV.read('2014_2019_census_data\ACSST5Y2017.S1701-2021-03-24T223356.csv', :quote_char => "|") 
data2018 = CSV.read('2014_2019_census_data\ACSST5Y2018.S1701-2021-03-24T223338.csv', :quote_char => "|")
data2019 = CSV.read('2014_2019_census_data\ACSST5Y2019.S1701-2021-03-24T223243.csv', :quote_char => "|")

data2014 = Spreadsheet.open('2014_2019_census_data\ACSST5Y2014.S1701-2021-03-24T223501.xls')
sheet1 = data2014.worksheet('Sheet1')
sheet1.each do |row|
    puts row
end

#puts data2014[12][2]
=begin
data2014.each do |row|  #start at row 2 of csv file, since the other 2 are titles
    if row < 2
        next
    else
=end