//
//  WeatherLocation.swift
//  WeatherGift
//
//  Created by Phillip  Tracy on 10/4/21.
//

import Foundation

class WeatherLocation: Codable {
    var name: String
    var latitude: Double
    var  longitude: Double
    
    init(name: String, latitude: Double, longitude: Double){
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
    }
    
    func getData(){
        let urlString = "https://api.openweathermap.org/data/2.5/onecall?lat=\(latitude)&lon=\(longitude)&exclude=minutely&units=imperial&appid=\(APIkeys.openWeatherKey)"
        
        guard let url = URL(string: urlString) else {
            print("ERROR: Could not create a URL from url \(urlString)")
            return
        }
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                print("ERROR: \(error.localizedDescription)")
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: [])
                print("\(json)")
            } catch {
                print("ERROR: \(error.localizedDescription)")
            }
        }
        task.resume()
                
    }
}
