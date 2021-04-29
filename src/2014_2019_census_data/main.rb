# Yash Dhayal
# CSC 415-02
# Assignment 2

# Framework/Skeleton/Prototype:

require 'spreadsheet'
require 'json'


#downloaded data tables, 55 rows by 67 columns. 54 x 66 in index notation
$data2014 = Spreadsheet.open('ACSST5Y2014.S1701-2021-03-24T223501.xls')
$data2019 = Spreadsheet.open('ACSST5Y2019.S1701-2021-03-24T223243.xls')


# global hash array containing cleaned data from above data tables
# each row represents a county, and consists of racial population and their below poverty level population per year
$DATA_SET = []


def scrape()    #WORKS!
    # scrape data from either downloaded file
    # loop to clean and push into global array DATA_SET
    # each row would be based on county

    sheet2014 = $data2014.worksheet('Sheet1')
    sheet2019 = $data2019.worksheet('Sheet1')

    x = 1
    while x < 63 do   # in data sheets, last county column is number 63
        countyHash = {
            :countyName =>    sheet2014[0,x][0..-30],       #county name

            :totalPop14 =>    sheet2014[1,x].to_s.gsub(',','').to_i,    # total population of county in 2014
            :PovPercent14 => (sheet2014[1,x+2].to_s.gsub(',','').to_f * 100).round(3),   # total poverty percentage of county in 2014
            :totalPop19 =>    sheet2019[1,x].to_s.gsub(',','').to_i,    # total population of county in 2019
            :PovPercent19 => (sheet2019[1,x+2].to_s.gsub(',','').to_f * 100).round(3),   # total poverty percentage of county in 2019

        #    :whiteTotal14 =>  sheet2014[11,x].to_s.gsub(',','').to_i,  # Total white pop in county in 2014
        #    :whitePov14 =>    sheet2014[11,x+1].to_s.gsub(',','').to_i, # Total white poverty pop in county in 2014
        #    :whiteTotal19 =>  sheet2019[11,x].to_s.gsub(',','').to_i,  # total white pop in county 2019
        #    :whitePov19 =>    sheet2019[11,x+1].to_s.gsub(',','').to_i, # total white poverty pop in county in 2019
            :whiteTotDelta => (sheet2019[11,x].to_s.gsub(',','').to_i) - (sheet2014[11,x].to_s.gsub(',','').to_i),     # total white pop change
            :whitePovDelta => (sheet2019[11,x+1].to_s.gsub(',','').to_i) - (sheet2014[11,x+1].to_s.gsub(',','').to_i), # total white poverty pop change

        #    :hispTotal14 =>   sheet2014[10,x].to_s.gsub(',','').to_i,
        #    :hispPov14 =>     sheet2014[10,x+1].to_s.gsub(',','').to_i,
        #    :hispTotal19 =>   sheet2019[10,x].to_s.gsub(',','').to_i,
        #    :hispPov19 =>     sheet2019[10,x+1].to_s.gsub(',','').to_i,
            :hispTotDelta => (sheet2019[10,x].to_s.gsub(',','').to_i) - (sheet2014[10,x].to_s.gsub(',','').to_i),
            :hispPovDelta => (sheet2019[10,x+1].to_s.gsub(',','').to_i) - (sheet2014[10,x+1].to_s.gsub(',','').to_i),

        #    :blackTotal14 =>  sheet2014[4,x].to_s.gsub(',','').to_i,
        #    :blackPov14 =>    sheet2014[4,x+1].to_s.gsub(',','').to_i,
        #    :blackTotal19 =>  sheet2019[4,x].to_s.gsub(',','').to_i,
        #    :blackPov19 =>    sheet2019[4,x+1].to_s.gsub(',','').to_i,
            :blackTotDelta => (sheet2019[4,x].to_s.gsub(',','').to_i) - (sheet2014[4,x].to_s.gsub(',','').to_i),
            :blackPovDelta => (sheet2019[4,x+1].to_s.gsub(',','').to_i) - (sheet2014[4,x+1].to_s.gsub(',','').to_i),

        #    :asianTotal14 =>  sheet2014[6,x].to_s.gsub(',','').to_i,
        #    :asianPov14 =>    sheet2014[6,x+1].to_s.gsub(',','').to_i,
        #    :asianTotal19 =>  sheet2019[6,x].to_s.gsub(',','').to_i,
        #    :asianPov19 =>    sheet2019[6,x+1].to_s.gsub(',','').to_i,
            :asianTotDelta => (sheet2019[6,x].to_s.gsub(',','').to_i) - (sheet2014[6,x].to_s.gsub(',','').to_i),
            :asianPovDetlta => (sheet2019[6,x+1].to_s.gsub(',','').to_i) - (sheet2014[6,x+1].to_s.gsub(',','').to_i),

        #    :nativeTotal14 => sheet2014[5,x].to_s.gsub(',','').to_i,
        #    :nativePov14 =>   sheet2014[5,x+1].to_s.gsub(',','').to_i,
        #    :nativeTotal19 => sheet2019[5,x].to_s.gsub(',','').to_i,
        #    :nativePov19 =>   sheet2019[5,x+1].to_s.gsub(',','').to_i,
            :nativeTotDelta => (sheet2019[5,x].to_s.gsub(',','').to_i) - (sheet2014[5,x].to_s.gsub(',','').to_i),
            :nativePovDelta => (sheet2019[5,x+1].to_s.gsub(',','').to_i) - (sheet2014[5,x+1].to_s.gsub(',','').to_i),

        #    :otherTotal14 =>  sheet2014[8,x].to_s.gsub(',','').to_i,
        #    :otherPov14 =>    sheet2014[8,x+1].to_s.gsub(',','').to_i,
        #    :otherTotal19 =>  sheet2019[8,x].to_s.gsub(',','').to_i,
        #    :otherPov19 =>    sheet2019[8,x+1].to_s.gsub(',','').to_i,
            :otherTotDelta => (sheet2019[8,x].to_s.gsub(',','').to_i) - (sheet2014[8,x].to_s.gsub(',','').to_i),
            :otherPovDelta => (sheet2019[8,x+1].to_s.gsub(',','').to_i) - (sheet2014[8,x+1].to_s.gsub(',','').to_i)
        }
        $DATA_SET.push(countyHash)
        x = x + 3
    end
end


# Main commands
scrape()

map_file = File.read('County_Boundaries_of_NJ.geojson') #reading geojson file to add necessary properties
parsed_map = JSON.parse(map_file)
dataSetJson = JSON.parse($DATA_SET.to_json)
#puts dataSetJson

id = 1  # variable for adding missing ID component
for x in parsed_map['features']
    a = x['properties']['COUNTY_LAB']  # assigning a temp variable for simplicity

    for y in dataSetJson
        b = y['countyName']  # assigning temp variable for simplicity
        
        if a == b # if county names match, add county stats from hash to parsed map
            x['id'] = id.to_s
            x['properties']['totalPop14'] = y['totalPop14']
            x['properties']['PovPercent14'] = y['PovPercent14']
            x['properties']['totalPop19'] = y['totalPop19']
            x['properties']['PovPercent19'] = y['PovPercent19']

            x['properties']['whiteTotDelta'] = y['whiteTotDelta']
            x['properties']['whitePovDelta'] = y['whitePovDelta']

            x['properties']['hispTotDelta'] = y['hispTotDelta']
            x['properties']['hispPovDelta'] = y['hispPovDelta']
            
            x['properties']['blackTotDelta'] = y['blackTotDelta']
            x['properties']['blackPovDelta'] = y['blackPovDelta']

            x['properties']['asianTotDelta'] = y['asianTotDelta']
            x['properties']['asianPovDetlta'] = y['asianPovDetlta']

            x['properties']['nativeTotDelta'] = y['nativeTotDelta']
            x['properties']['nativePovDelta'] = y['nativePovDelta']

            x['properties']['otherTotDelta'] = y['otherTotDelta']
            x['properties']['otherPovDelta'] = y['otherPovDelta']
            break
        end
    end
    id += 1
end

File.write('County_Boundaries_of_NJ_EDITED.geojson', JSON.dump(parsed_map)) #writing updated geojson data into a new file
