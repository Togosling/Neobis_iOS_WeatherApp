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
    let main: Main
    let visibility: Int
    let wind: Wind
    let name: String?
}

struct Coord: Codable {
    let lon, lat: Double?
}

struct Main: Codable {
    let temp: Double
    let pressure, humidity: Int

    enum CodingKeys: String, CodingKey {
        case temp
        case pressure, humidity
    }
}

struct Weather: Codable {
    let main, icon: String
}

struct Wind: Codable {
    let speed: Double
}
