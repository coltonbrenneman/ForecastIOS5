//
//  DayController.swift
//  Forecast
//
//  Created by Colton Brenneman on 6/13/23.
//

import Foundation

class DayController {
    
    // MARK: - Properties
    private static let baseURLString = "https://api.weatherbit.io/v2.0"
    
     // MARK: - Functions
    static func fetchDays(completion: @escaping([Day]?) -> Void) {
        // Goals 1. Create base url 2. add the components 3. add the query items 4. do our data task
        guard let baseURL = URL(string: baseURLString) else { return }
        let forcastURL = baseURL.appendingPathComponent("forecast")
        let dailyURL = forcastURL.appendingPathComponent("daily")
        var urlComponents = URLComponents(url: dailyURL, resolvingAgainstBaseURL: true)
        
        let apiQuery = URLQueryItem(name: "key", value: "66b860501a054c83b086019d99e0f316")
        let cityQuery = URLQueryItem(name: "city", value: "Saint George")
        let unitsQuery = URLQueryItem(name: "units", value: "I")
        urlComponents?.queryItems = [apiQuery, cityQuery, unitsQuery]
        
        guard let finalURL = urlComponents?.url else { return }
        print(finalURL)
        
        URLSession.shared.dataTask(with: finalURL) { dayData, _, dayError in
            if let dayError {
                print("There was an error fetching the data. The url is", finalURL, "the error is", dayError.localizedDescription)
            } //End of dayError
            guard let data = dayData else {  return }
            do {
                if let topLevelDictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] {
                    let cityName = topLevelDictionary["city_name"] as! String
                    let dataArray = topLevelDictionary["data"] as! [[String : Any]]
                
                var tempDayArray: [Day] = []
                
                for dayDictionary in dataArray {
                    guard let day = Day(dayDictionary: dayDictionary, cityName: cityName) else { return }
                    tempDayArray.append(day)
                }
                    completion(tempDayArray)
            }
            } catch {
                completion(nil)
            } //End of do try catch
        }.resume() //End of dataTask
    } //End of fetchDays func
} //End of class
