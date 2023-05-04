//
//  WeatherViewMode.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Тагай Абдылдаев on 20/4/23.
//

import Foundation

protocol WeatherViewModelType {
    var weather: OverallWeatherModel {get set}
    func goBackToSearch()
}

class WeatherViewModel: WeatherViewModelType {
    
    var coordinator = WeatherCoordinator(navController: BaseNavigationController.init(), weather: OverallWeatherModel.init())
    
    var weather: OverallWeatherModel
    
    func goBackToSearch() {
        coordinator.pop()
    }
           
    init(overallWeather: OverallWeatherModel){
        self.weather = overallWeather
    }
}
