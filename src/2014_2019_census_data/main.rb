# Yash Dhayal
# CSC 415-02
# Assignment 2

# Framework/Skeleton/Prototype:

require 'spreadsheet'
#require 'fusioncharts' # https://www.fusioncharts.com/blog/creating-charts-ruby-on-rails/

#downloaded data tables, 55 rows by 67 columns. 54 x 66 in index notation
$data2014 = Spreadsheet.open('ACSST5Y2014.S1701-2021-03-24T223501.xls')
$data2015 = Spreadsheet.open('ACSST5Y2015.S1701-2021-03-24T223430.xls')
$data2016 = Spreadsheet.open('ACSST5Y2016.S1701-2021-03-24T223412.xls')
$data2017 = Spreadsheet.open('ACSST5Y2017.S1701-2021-03-24T223356.xls')
$data2018 = Spreadsheet.open('ACSST5Y2018.S1701-2021-03-24T223338.xls')
$data2019 = Spreadsheet.open('ACSST5Y2019.S1701-2021-03-24T223243.xls')


# global hash array containing cleaned data from above data tables
# each row represents a county, and consists of racial population and their below poverty level population per year
$DATA_SET = []


def scrape()    #WORKS!
    # scrape data from either downloaded file
    # loop to clean and push into global array DATA_SET
    # each row would be based on county

    sheet2014 = $data2014.worksheet('Sheet1')
    sheet2015 = $data2015.worksheet('Sheet1')
    sheet2016 = $data2016.worksheet('Sheet1')
    sheet2017 = $data2017.worksheet('Sheet1')
    sheet2018 = $data2018.worksheet('Sheet1')
    sheet2019 = $data2019.worksheet('Sheet1')

    x = 1
    while x < 63 do   # in data sheets, last county column is number 63
        countyHash = {
            :countyName =>    sheet2014[0,x][0..-30],
            :whiteTotal14 =>  sheet2014[11,x],
            :whitePov14 =>    sheet2014[11,x+1],
            :whiteTotal15 =>  sheet2015[11,x],
            :whitePov15 =>    sheet2015[11,x+1],
            :whiteTotal16 =>  sheet2016[11,x],
            :whitePov16 =>    sheet2016[11,x+1],
            :whiteTotal17 =>  sheet2017[11,x],
            :whitePov17 =>    sheet2017[11,x+1],
            :whiteTotal18 =>  sheet2018[11,x],
            :whitePov18 =>    sheet2018[11,x+1],
            :whiteTotal19 =>  sheet2019[11,x],
            :whitePov19 =>    sheet2019[11,x+1],

            :hispTotal14 =>   sheet2014[10,x],
            :hispPov14 =>     sheet2014[10,x+1],
            :hispTotal15 =>   sheet2015[10,x],
            :hispPov15 =>     sheet2015[10,x+1],
            :hispTotal16 =>   sheet2016[10,x],
            :hispPov16 =>     sheet2016[10,x+1],
            :hispTotal17 =>   sheet2017[10,x],
            :hispPov17 =>     sheet2017[10,x+1],
            :hispTotal18 =>   sheet2018[10,x],
            :hispPov18 =>     sheet2018[10,x+1],
            :hispTotal19 =>   sheet2019[10,x],
            :hispPov19 =>     sheet2019[10,x+1],

            :blackTotal14 =>  sheet2014[4,x],
            :blackPov14 =>    sheet2014[4,x+1],
            :blackTotal15 =>  sheet2015[4,x],
            :blackPov15 =>    sheet2015[4,x+1],
            :blackTotal16 =>  sheet2016[4,x],
            :blackPov16 =>    sheet2016[4,x+1],
            :blackTotal17 =>  sheet2017[4,x],
            :blackPov17 =>    sheet2017[4,x+1],
            :blackTotal18 =>  sheet2018[4,x],
            :blackPov18 =>    sheet2018[4,x+1],
            :blackTotal19 =>  sheet2019[4,x],
            :blackPov19 =>    sheet2019[4,x+1],

            :asianTotal14 =>  sheet2014[6,x],
            :asianPov14 =>    sheet2014[6,x+1],
            :asianTotal15 =>  sheet2015[6,x],
            :asianPov15 =>    sheet2015[6,x+1],
            :asianTotal16 =>  sheet2016[6,x],
            :asianPov16 =>    sheet2016[6,x+1],
            :asianTotal17 =>  sheet2017[6,x],
            :asianPov17 =>    sheet2017[6,x+1],
            :asianTotal18 =>  sheet2018[6,x],
            :asianPov18 =>    sheet2018[6,x+1],
            :asianTotal19 =>  sheet2019[6,x],
            :asianPov19 =>    sheet2019[6,x+1],


            :nativeTotal14 => sheet2014[5,x],
            :nativePov14 =>   sheet2014[5,x+1],
            :nativeTotal15 => sheet2015[5,x],
            :nativePov15 =>   sheet2015[5,x+1],
            :nativeTotal16 => sheet2016[5,x],
            :nativePov16 =>   sheet2016[5,x+1],
            :nativeTotal17 => sheet2017[5,x],
            :nativePov17 =>   sheet2017[5,x+1],
            :nativeTotal18 => sheet2018[5,x],
            :nativePov18 =>   sheet2018[5,x+1],
            :nativeTotal19 => sheet2019[5,x],
            :nativePov19 =>   sheet2019[5,x+1],


            :otherTotal14 =>  sheet2014[8,x],
            :otherPov14 =>    sheet2014[8,x+1],
            :otherTotal15 =>  sheet2015[8,x],
            :otherPov15 =>    sheet2015[8,x+1],
            :otherTotal16 =>  sheet2016[8,x],
            :otherPov16 =>    sheet2016[8,x+1],
            :otherTotal17 =>  sheet2017[8,x],
            :otherPov17 =>    sheet2017[8,x+1],
            :otherTotal18 =>  sheet2018[8,x],
            :otherPov18 =>    sheet2018[8,x+1],
            :otherTotal19 =>  sheet2019[8,x],
            :otherPov19 =>    sheet2019[8,x+1]
        }
        $DATA_SET.push(countyHash)
        x = x + 3
    end
end


#county class. Data from dataset
class County
    @@countyName = ""

    @@countyData = []

    @@countyOfficialContact = []    #NEED TO FIND

    def countyName(x)
        @@countyName = @@countyData[x][:countyName]
    end

    def addData(x)
        @@countyData.push($DATA_SET[x])
    end
end

scrape()
for x in $DATA_SET
    puts x[:countyName]
end