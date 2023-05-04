//
//  Coordinator.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Тагай Абдылдаев on 4/5/23.
//

import UIKit

protocol Coordinator {
    var parentCoordinator: Coordinator? { get set }
    var children: [Coordinator] { get set }
    var navigationController : BaseNavigationController { get set }

    func start()
    func pop()
}
