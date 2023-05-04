//
//  BaseNavigationController.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Тагай Абдылдаев on 4/5/23.
//

import UIKit


class BaseNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationBar.isHidden = true
    }
}
