//
//  CityModel.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Тагай Абдылдаев on 15/4/23.
//

import Foundation

struct City: Codable {
    let name: String
    let lat, lon: Double
    let country: String
    let state: String?

    enum CodingKeys: String, CodingKey {
        case name
        case lat, lon, country, state
    }
}

typealias CityGroup = [City]

