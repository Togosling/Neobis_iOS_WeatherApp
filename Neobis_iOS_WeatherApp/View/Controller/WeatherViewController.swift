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
    
    fileprivate let weatherViewModel: WeatherViewModel
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
        weatherViewModel.bindableWeather.bind {[weak self] weather in
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
                self?.weatherView.firstDay.tempLabel.text = "\(String(weather?.temp1 ?? 0))°C"
                self?.weatherView.secondDay.tempLabel.text = "\(String(weather?.temp2 ?? 0))°C"
                self?.weatherView.thirdDay.tempLabel.text = "\(String(weather?.temp3 ?? 0))°C"
                self?.weatherView.forthDay.tempLabel.text = "\(String(weather?.temp4 ?? 0))°C"
                self?.weatherView.fifthDay.tempLabel.text = "\(String(weather?.temp5 ?? 0))°C"
                self?.weatherView.firstDay.imageView.sd_setImage(with: weather?.icon1)
                self?.weatherView.secondDay.imageView.sd_setImage(with: weather?.icon2)
                self?.weatherView.thirdDay.imageView.sd_setImage(with: weather?.icon3)
                self?.weatherView.forthDay.imageView.sd_setImage(with: weather?.icon4)
                self?.weatherView.fifthDay.imageView.sd_setImage(with: weather?.icon5)
                self?.weatherView.firstDay.dayOfTheWeekLabel.text = weather?.date1
                self?.weatherView.secondDay.dayOfTheWeekLabel.text = weather?.date2
                self?.weatherView.thirdDay.dayOfTheWeekLabel.text = weather?.date3
                self?.weatherView.forthDay.dayOfTheWeekLabel.text = weather?.date4
                self?.weatherView.fifthDay.dayOfTheWeekLabel.text = weather?.date5
                self?.hud.dismiss(animated: true)
            }
        }
    }
    
    @objc fileprivate func handleSearch() {
        let searchController = SearchController(searchViewModel: weatherViewModel.searchViewModel)
        searchController.modalPresentationStyle = .fullScreen
        present(searchController, animated: true)
    }
        
    fileprivate func setupViews() {
        view.addSubview(weatherView)
        weatherView.snp.makeConstraints { make in
            make.size.equalToSuperview()
        }
      
    }
    
    init(weatherViewModel: WeatherViewModel) {
        self.weatherViewModel = weatherViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

