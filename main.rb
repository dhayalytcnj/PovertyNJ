# Yash Dhayal
# CSC 415-02
# Assignment 2

# Framework/Skeleton/Prototype:

require 'spreadsheet'
require 'fusioncharts' # https://www.fusioncharts.com/blog/creating-charts-ruby-on-rails/

$DATA_SET = Array.new #2d array with rows and columns... or could be a hashmapped 2d array

#NEED TO LEARN GEM AND SEE IF PERMITTED. POTENTIALLY REASSIGN VALUES IN chart() method
@CHART = Fusioncharts::Chart.new({  #https://www.fusioncharts.com/blog/creating-charts-ruby-on-rails/
    :height => ?,
    :weight => ?,
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

def scraper(#filename = File.new() OR no attrs )
    # scrape data from either downloaded file or site. This can be called within webcrawler method

    #loop to clean and push into global array DATA_SET
end


def webcrawler
    # webcrawl a site for data, to either download or scrape (depending on whats easier to access)
=begin
    potential sources:
    https://data.census.gov/cedsci/table?q=NJ%20poverty&tid=ACSST5Y2019.S1701&hidePreview=false
    
=end
end


def chart1(DATA_SET)
    # modify data in chart global variable
end

def chart2(DATA_SET) 
    # create another chart
end