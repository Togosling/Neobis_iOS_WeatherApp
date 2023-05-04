//
//  WeatherViewMode.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Тагай Абдылдаев on 20/4/23.
//

import Foundation

protocol WeatherViewModelType {
    var weather: OverallWeatherModel {get set}
}

class WeatherViewModel: WeatherViewModelType {
    
    var weather: OverallWeatherModel
           
    init(overallWeather: OverallWeatherModel){
        self.weather = overallWeather
    }
}
