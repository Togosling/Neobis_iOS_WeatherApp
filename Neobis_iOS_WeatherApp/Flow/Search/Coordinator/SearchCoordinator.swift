//
//  SearchCoordinator.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Тагай Абдылдаев on 4/5/23.
//

import Foundation
import UIKit

class SearchCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: BaseNavigationController
    
    init(navController: BaseNavigationController) {
        self.navigationController = navController
    }
    
    func start() {
        let viewModel = SearchViewModel.init()
        viewModel.coordinator = self
        let searchController = SearchController(searchViewModel: viewModel)
        navigationController.pushViewController(searchController, animated: true)
    }
    
    func pop() {
        
    }
    
    func showWeather(overallWeatherModel: OverallWeatherModel) {
        let weatherCoordinator = WeatherCoordinator(navController: navigationController, weather: overallWeatherModel)
        weatherCoordinator.start()
    }
}
