//
//  SearchViewModel.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Тагай Абдылдаев on 1/5/23.
//

import Foundation

protocol SearchViewModelType {
    
}

class SearchViewModel {
    
    var bindableSearchWeather = Bindable<OverallWeatherModel>()
    var searchCity: String? {didSet {fetchCityData(city: searchCity ?? "")}}
    
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
            self?.overallWeatherModel.date = DateFormat.shared.currentDate()
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
            self?.overallWeatherModel.date1 = DateFormat.shared.nextDate(day: 1)
            self?.overallWeatherModel.date2 = DateFormat.shared.nextDate(day: 2)
            self?.overallWeatherModel.date3 = DateFormat.shared.nextDate(day: 3)
            self?.overallWeatherModel.date4 = DateFormat.shared.nextDate(day: 4)
            self?.overallWeatherModel.date5 = DateFormat.shared.nextDate(day: 5)
            self?.bindableSearchWeather.value = self?.overallWeatherModel
        }
    }
}
