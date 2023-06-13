//
//  Day.swift
//  Forecast
//
//  Created by Colton Brenneman on 6/13/23.
//

import Foundation

class Day {
    
        let cityName: String
        let temp: Double
        let highTemp: Double
        let lowTemp: Double
        let description: String
        let iconString: String
        let validDate: String

        init?(dayDictionary: [String : Any], cityName: String ) {

            guard let temp = dayDictionary["temp"] as? Double,
            let highTemp = dayDictionary["high_temp"] as? Double,
            let lowTemp = dayDictionary["low_temp"] as? Double,
            let validData = dayDictionary["valid_date"] as? String,
                  
            let weatherDict = dayDictionary["weather"] as? [String:Any],
            let description = weatherDict["description"] as? String,
            let iconString = weatherDict["icon"] as? String else {return nil}

            self.temp = temp
            self.highTemp = highTemp
            self.lowTemp = lowTemp
            self.validDate = validData
            self.description = description
            self.iconString = iconString
            self.cityName = cityName
        }
} //End of class
