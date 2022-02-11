//
//  jsonModel.swift
//  AnotherWeatehr
//
//  Created by Nikita on 15.12.2021.
//

import Foundation

struct Weather: Decodable {
    var name: String
    var main: Main

    struct Main: Decodable {
        var temp: Double
        var feelsLike: Double
        var tempMin: Double
        var tempMax: Double
        var pressure: Double
        var humidity: Double
        
        init(temp: Double) {
            self.temp = temp
             feelsLike = 0
             tempMin = 0
             tempMax = 0
             pressure = 0
             humidity = 0        }

        enum CodingKeys: String, CodingKey {
            case feelsLike = "feels_like"
            case tempMin = "temp_min"
            case tempMax = "temp_max"
            case temp
            case pressure
            case humidity
        }
    }
    
    init(name: String, temp: Double) {
        self.name = name
        main = Main(temp: temp)
    }

}
