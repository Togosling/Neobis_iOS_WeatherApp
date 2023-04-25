//
//  ViewController.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Тагай Абдылдаев on 14/4/23.
//

import UIKit
import SnapKit
import SDWebImage
import JGProgressHUD


class MainViewController: UIViewController {
    
    fileprivate var weatherViewModel = WeatherViewModel()
    fileprivate let weatherView = WeatherView()
    fileprivate let hud: JGProgressHUD = {
        let hud = JGProgressHUD(style: .dark)
        hud.textLabel.text = "Checking Weather"
        return hud
    }()
    
    override func viewDidLoad() {
        super .viewDidLoad()
        
        setupViews()
        weatherView.searchButton.addTarget(self, action: #selector(handleSearch), for: .touchUpInside)
        weatherObserver()
    }
    
    fileprivate func weatherObserver() {
        weatherViewModel.bindable.bind {[weak self] weather in
            DispatchQueue.main.async {
                self?.hud.show(in: self?.view ?? UIView())
                self?.weatherView.tempLabel.text = "\(String(weather?.temp ?? 0))°C"
                self?.weatherView.cityLabel.text = weather?.city
                self?.weatherView.countryLabel.text = weather?.country
                self?.weatherView.dateLabel.text = weather?.date
                self?.weatherView.airPressureIndexLabel.text = "\(String(weather?.airPressure ?? 0)) mb"
                self?.weatherView.humidityIndexLabel.text = "\(String(weather?.humidity ?? 0))%"
                self?.weatherView.visibilityIndexLabel.text = "\(String(weather?.visibility ?? 0)) m"
                self?.weatherView.windIndexLabel.text = "\(String(weather?.windStatus ?? 0)) mph"
                self?.weatherView.mainTempImageView.sd_setImage(with: weather?.weatherIconUrl)
                self?.hud.dismiss(animated: true)
            }
        }
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

