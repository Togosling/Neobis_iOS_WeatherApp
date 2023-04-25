//
//  TemperatureModel.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Тагай Абдылдаев on 15/4/23.
//

import Foundation

struct WeatherGroup: Codable {
    let coord: Coord?
    let weather: [Weather]?
    let base: String?
    let main: Main
    let visibility: Int
    let wind: Wind
    let dt: Int?
    let timezone, id: Int?
    let name: String?
    let cod: Int?
}

struct Coord: Codable {
    let lon, lat: Double?
}

struct Main: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, humidity: Int

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
    }
}

struct Weather: Codable {
    let id: Int?
    let main, description, icon: String
}

struct Wind: Codable {
    let speed: Double
    let deg: Int?
    let gust: Double?
}
