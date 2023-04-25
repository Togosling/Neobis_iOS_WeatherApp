//
//  NextWeekModel.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Тагай Абдылдаев on 25/4/23.
//

import Foundation

struct NextWeek: Codable {
    let list: [List]
}

struct List: Codable {
    let main: MainClass
    let weather: [Weather]

    enum CodingKeys: String, CodingKey {
        case  main, weather
    }
}

struct MainClass: Codable {
    let temp, feelsLike: Double


    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
    }
}

struct NextWeather: Codable {
    let icon: String
}


