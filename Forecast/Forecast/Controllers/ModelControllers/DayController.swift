//
//  DayController.swift
//  Forecast
//
//  Created by Colton Brenneman on 6/13/23.
//

import Foundation

class DayController {
    
     // MARK: - Functions
    static func fetchDays(completion: @escaping([Day]?) -> Void) {
        // Goals 1. Create base url 2. add the components 3. add the query items 4. do our data task
        guard let baseURL = URL(string: "https://api.weatherbit.io/v2.0/forecast/daily") else { return }
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        
        var apiQuery = URLQueryItem(name: "key", value: "66b860501a054c83b086019d99e0f316")
        var cityQuery = URLQueryItem(name: "city", value: "St, George, UT")
        var unitsQuery = URLQueryItem(name: "units", value: "I")
        urlComponents?.queryItems = [apiQuery, cityQuery, unitsQuery]
        
        guard let finalURL = urlComponents?.url else { return }
        print(finalURL)
    }
} //End of class
