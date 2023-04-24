//
//  WeatherViewMode.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Тагай Абдылдаев on 20/4/23.
//

import Foundation


class WeatherViewModel {
    
    var bindable = Bindable<String>()
    
    var date: String?
    var city: String?
    var country: String?
    var temp : Int?
    var weatherIcon: String?
    var windStatus: Int?
    var humidity: Int?
    var visibility: Int?
    var airPressure: Int?
    var lat: Double?
    var long: Double?
    
        
    func fetchCityData(city: String) {
        Service.shared.fetchCityData(city: city) {[weak self] cityGroup in
            guard let city = cityGroup.first else {return}
            print(city.name)
            self?.bindable.value = city.name
        }
    }
}
