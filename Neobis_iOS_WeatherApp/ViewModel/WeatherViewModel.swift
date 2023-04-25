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
    var date1: String?
    var date2: String?
    var date3: String?
    var date4: String?
    var date5: String?

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
            self?.weatherIconUrl = URL(string: weatherIcon)
            self?.windStatus = Int(weatherGroup.wind.speed)
            self?.humidity = weatherGroup.main.humidity
            self?.visibility = weatherGroup.visibility
            self?.airPressure = weatherGroup.main.pressure
            self?.fetchNextWeekData(lat: lat, long: long)
        }
    }
    fileprivate func fetchNextWeekData(lat: Double, long: Double) {
        Service.shared.fetchTempDataForWeek(lat: lat, long: long) { [weak self] nextweek in
            self?.temp1 = Int(nextweek.list[0].main.temp - 273)
            self?.temp2 = Int(nextweek.list[1].main.temp - 273)
            self?.temp3 = Int(nextweek.list[2].main.temp - 273)
            self?.temp4 = Int(nextweek.list[3].main.temp - 273)
            self?.temp5 = Int(nextweek.list[4].main.temp - 273)
            let weatherIcon1 = "http://openweathermap.org/img/w/\(nextweek.list[0].weather.first?.icon ?? "").png"
            let weatherIcon2 = "http://openweathermap.org/img/w/\(nextweek.list[1].weather.first?.icon ?? "").png"
            let weatherIcon3 = "http://openweathermap.org/img/w/\(nextweek.list[2].weather.first?.icon ?? "").png"
            let weatherIcon4 = "http://openweathermap.org/img/w/\(nextweek.list[3].weather.first?.icon ?? "").png"
            let weatherIcon5 = "http://openweathermap.org/img/w/\(nextweek.list[4].weather.first?.icon ?? "").png"
            self?.icon1 = URL(string: weatherIcon1)
            self?.icon2 = URL(string: weatherIcon2)
            self?.icon3 = URL(string: weatherIcon3)
            self?.icon4 = URL(string: weatherIcon4)
            self?.icon5 = URL(string: weatherIcon5)
            self?.date1 = self?.nextDate(day: 1)
            self?.date2 = self?.nextDate(day: 2)
            self?.date3 = self?.nextDate(day: 3)
            self?.date4 = self?.nextDate(day: 4)
            self?.date5 = self?.nextDate(day: 5)
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
    fileprivate func nextDate(day: Int) -> String {
        let calendar = Calendar.current
        let today = Date()
        guard let nextDate = calendar.date(byAdding: .day, value: day, to: today) else {return ""}
        let weekDay = calendar.component(.weekday, from: nextDate)
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US")
        let weekDayName = dateFormatter.weekdaySymbols[weekDay - 1]
        return weekDayName
    }
}
