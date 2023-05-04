//
//  AppCoordinator.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Тагай Абдылдаев on 4/5/23.
//

import UIKit

class AppCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: BaseNavigationController
    
    init(navCon : BaseNavigationController) {
        self.navigationController = navCon
    }
    
    func start() {
        let searchCoordinator = SearchCoordinator(navController: navigationController)
        searchCoordinator.start()
    }
    
    func pop() {
        
    }
}
