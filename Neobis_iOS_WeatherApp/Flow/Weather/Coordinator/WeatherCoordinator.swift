//
//  WeatherCoordinator.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Тагай Абдылдаев on 4/5/23.
//

import UIKit

class WeatherCoordinator: Coordinator {
    
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: BaseNavigationController
    var weather: OverallWeatherModel
    
    init(navController: BaseNavigationController, weather: OverallWeatherModel) {
        self.navigationController = navController
        self.weather = weather
    }
    
    func start() {
        DispatchQueue.main.async {
            let viewModel = WeatherViewModel(overallWeather: self.weather)
            viewModel.coordinator = self
            let weatherController = WeatherViewController(weatherViewModel: viewModel)
            self.navigationController.pushViewController(weatherController, animated: true)
        }
    }
    
    func pop() {
        self.navigationController.popViewController(animated: true)
    }
}
