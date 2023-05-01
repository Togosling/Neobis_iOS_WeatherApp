//
//  WeatherViewMode.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Тагай Абдылдаев on 20/4/23.
//

import Foundation

//protocol WeatherViewModelType {
//
//    func fetchCityData(city: String)
//    func fetchWeatherData(lat: Double, long: Double)
//    func fetchNextWeekData(lat: Double, long: Double)
//}


class WeatherViewModel {
    
    var searchViewModel: SearchViewModel
    
    var bindableWeather = Bindable<OverallWeatherModel>()
    fileprivate var overallWeatherModel =  OverallWeatherModel()
    
    fileprivate func fetchCityData(city: String) {
        Service.shared.fetchCityData(city: city) {[weak self] cityGroup in
            guard let city = cityGroup.first else {return}
            self?.overallWeatherModel.city = city.name
            self?.overallWeatherModel.country = city.country
            self?.fetchWeatherData(lat: city.lat, long: city.lon)
        }
    }
    
    fileprivate func fetchWeatherData(lat: Double, long: Double) {
        Service.shared.fetchTempData(lat: lat, long: long) {[weak self] weatherGroup in
            self?.overallWeatherModel.date = self?.currentDate()
            self?.overallWeatherModel.temp = Int(weatherGroup.main.temp - 273)
            let weatherIcon = "http://openweathermap.org/img/w/\(weatherGroup.weather?.first?.icon ?? "").png"
            self?.overallWeatherModel.weatherIconUrl = URL(string: weatherIcon)
            self?.overallWeatherModel.windStatus = Int(weatherGroup.wind.speed)
            self?.overallWeatherModel.humidity = weatherGroup.main.humidity
            self?.overallWeatherModel.visibility = weatherGroup.visibility
            self?.overallWeatherModel.airPressure = weatherGroup.main.pressure
            self?.fetchNextWeekData(lat: lat, long: long)
        }
    }
    fileprivate func fetchNextWeekData(lat: Double, long: Double) {
        Service.shared.fetchTempDataForWeek(lat: lat, long: long) { [weak self] nextweek in
            self?.overallWeatherModel.temp1 = Int(nextweek.list[0].main.temp - 273)
            self?.overallWeatherModel.temp2 = Int(nextweek.list[1].main.temp - 273)
            self?.overallWeatherModel.temp3 = Int(nextweek.list[2].main.temp - 273)
            self?.overallWeatherModel.temp4 = Int(nextweek.list[3].main.temp - 273)
            self?.overallWeatherModel.temp5 = Int(nextweek.list[4].main.temp - 273)
            let weatherIcon1 = "http://openweathermap.org/img/w/\(nextweek.list[0].weather.first?.icon ?? "").png"
            let weatherIcon2 = "http://openweathermap.org/img/w/\(nextweek.list[1].weather.first?.icon ?? "").png"
            let weatherIcon3 = "http://openweathermap.org/img/w/\(nextweek.list[2].weather.first?.icon ?? "").png"
            let weatherIcon4 = "http://openweathermap.org/img/w/\(nextweek.list[3].weather.first?.icon ?? "").png"
            let weatherIcon5 = "http://openweathermap.org/img/w/\(nextweek.list[4].weather.first?.icon ?? "").png"
            self?.overallWeatherModel.icon1 = URL(string: weatherIcon1)
            self?.overallWeatherModel.icon2 = URL(string: weatherIcon2)
            self?.overallWeatherModel.icon3 = URL(string: weatherIcon3)
            self?.overallWeatherModel.icon4 = URL(string: weatherIcon4)
            self?.overallWeatherModel.icon5 = URL(string: weatherIcon5)
            self?.overallWeatherModel.date1 = self?.nextDate(day: 1)
            self?.overallWeatherModel.date2 = self?.nextDate(day: 2)
            self?.overallWeatherModel.date3 = self?.nextDate(day: 3)
            self?.overallWeatherModel.date4 = self?.nextDate(day: 4)
            self?.overallWeatherModel.date5 = self?.nextDate(day: 5)
            self?.bindableWeather.value = self?.overallWeatherModel
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
    
    init(searchViewModel: SearchViewModel){
        self.searchViewModel = searchViewModel
        searchViewModel.bindableSearchCity.bind { [weak self] searchCity in
            self?.fetchCityData(city: searchCity ?? "")
        }
    }
}
