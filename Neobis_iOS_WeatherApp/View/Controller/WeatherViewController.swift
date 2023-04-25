//
//  ViewController.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Тагай Абдылдаев on 14/4/23.
//

import UIKit
import SnapKit


class MainViewController: UIViewController {
    
    var weatherViewModel = WeatherViewModel()
    let weatherView = WeatherView()
    
    override func viewDidLoad() {
        super .viewDidLoad()
        
        setupViews()
        weatherView.searchButton.addTarget(self, action: #selector(handleSearch), for: .touchUpInside)
        weatherViewModel.bindable.bind(observer: { city in
            print(city)
        })
    }
    
    @objc fileprivate func handleSearch() {
        let searchController = SearchController()
        searchController.weatherViewModel = weatherViewModel
        searchController.modalPresentationStyle = .fullScreen
        present(searchController, animated: true)
    }
        
    fileprivate func setupViews() {
        view.addSubview(weatherView)
        weatherView.snp.makeConstraints { make in
            make.size.equalToSuperview()
        }
      
    }
}

