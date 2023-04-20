//
//  WeatherViewMode.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Тагай Абдылдаев on 20/4/23.
//

import Foundation


class WeatherViewModel {
    
    let date: String
    let city: String
    let country: String
    let temp : Int
    let weatherIcon: String
    let windStatus: Int
    let humidity: Int
    let visibility: Int
    let airPressure: Int
    
    init(date: String, city: String, country: String, temp: Int, weatherIcon: String, windStatus: Int, humidity: Int, visibility: Int, airPressure: Int) {
        self.date = date
        self.city = city
        self.country = country
        self.temp = temp
        self.weatherIcon = weatherIcon
        self.windStatus = windStatus
        self.humidity = humidity
        self.visibility = visibility
        self.airPressure = airPressure
    }
}
