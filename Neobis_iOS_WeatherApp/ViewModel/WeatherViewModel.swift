//
//  WeatherViewMode.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Тагай Абдылдаев on 20/4/23.
//

import Foundation


class WeatherViewModel {
    
    var bindable = Bindable<WeatherViewModel>()
    
    var date: String?
    var city: String?
    var country: String?
    var temp : Int?
    var weatherIconUrl: URL?
    var windStatus: Int?
    var humidity: Int?
    var visibility: Int?
    var airPressure: Int?
    var lat: Double?
    var long: Double?
    var icon1: URL?
    var icon2: URL?
    var icon3: URL?
    var icon4: URL?
    var icon5: URL?
    var temp1: Int?
    var temp2: Int?
    var temp3: Int?
    var temp4: Int?
    var temp5: Int?
    
        
    func fetchCityData(city: String) {
        Service.shared.fetchCityData(city: city) {[weak self] cityGroup in
            guard let city = cityGroup.first else {return}
            self?.city = city.name
            self?.country = city.country
            self?.fetchWeatherData(lat: city.lat, long: city.lon)
        }
    }
    
    fileprivate func fetchWeatherData(lat: Double, long: Double) {
        Service.shared.fetchTempData(lat: lat, long: long) {[weak self] weatherGroup in
            self?.date = self?.currentDate()
            self?.temp = Int(weatherGroup.main.temp - 273)
            let weatherIcon = "http://openweathermap.org/img/w/\(weatherGroup.weather?.first?.icon ?? "").png"
            print(weatherIcon)
            self?.weatherIconUrl = URL(string: weatherIcon)
            self?.windStatus = Int(weatherGroup.wind.speed)
            self?.humidity = weatherGroup.main.humidity
            self?.visibility = weatherGroup.visibility
            self?.airPressure = weatherGroup.main.pressure
            self?.bindable.value = self
        }
    }
    
    fileprivate func currentDate() -> String {
        let calendar = Calendar.current
        let day = calendar.component(.day, from: Date())
        let month = calendar.component(.month, from: Date())
        let year = calendar.component(.year, from: Date())
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US")
        let mothnName = dateFormatter.monthSymbols[month - 1]
        return "Today, \(day) \(mothnName), \(year)"
    }
}
