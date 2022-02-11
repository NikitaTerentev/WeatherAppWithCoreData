//
//  WeatherViewModel.swift
//  AnotherWeatehr
//
//  Created by Nikita on 15.12.2021.
//

import Foundation


class WeatherModel {
    let  weather: Weather
    
    init(weather: Weather) {
        self.weather = weather
    }
    
    var nameString: String {
        return String(weather.name)
    }
    
    
    var temrepatureString: String {
        return String(weather.main.temp)

    }

    
    
    //MARK: Convertion Kelvin to Celsius
    
//    func convertion(_ tempCelsius: Double) -> String {
//
//        return String(format: "%.0f", tempCelsius.kelvinToCelsius) + "˚C"
//    }
    
    
}
