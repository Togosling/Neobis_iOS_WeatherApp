//
//  WeatherViewMode.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Тагай Абдылдаев on 20/4/23.
//

import Foundation

protocol WeatherViewModelType {

}

class WeatherViewModel {
    
    var searchViewModel: SearchViewModel
    var bindableWeather = Bindable<OverallWeatherModel>()
    
    
    init(searchViewModel: SearchViewModel){
        self.searchViewModel = searchViewModel
        searchViewModel.bindableSearchWeather.bind { [weak self] weather in
            self?.bindableWeather.value = weather
        }
    }
}
