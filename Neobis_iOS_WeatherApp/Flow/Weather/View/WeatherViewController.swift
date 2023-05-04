//
//  ViewController.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Тагай Абдылдаев on 14/4/23.
//

import UIKit
import SnapKit
import SDWebImage

class WeatherViewController: UIViewController {
    
    fileprivate var weatherViewModel: WeatherViewModelType
    fileprivate let weatherView = WeatherView()
    
    override func viewDidLoad() {
        super .viewDidLoad()
        
        setupViews()
        weatherView.searchButton.addTarget(self, action: #selector(handleSearch), for: .touchUpInside)
        updateUI()
    }
    
    fileprivate func updateUI() {
        DispatchQueue.main.async {
            self.weatherView.tempLabel.text = "\(self.weatherViewModel.weather.temp ?? 0)°C"
            self.weatherView.cityLabel.text = self.weatherViewModel.weather.city
            self.weatherView.countryLabel.text = self.weatherViewModel.weather.country
            self.weatherView.dateLabel.text = self.weatherViewModel.weather.date
            self.weatherView.airPressureIndexLabel.text = "\(self.weatherViewModel.weather.airPressure ?? 0) mb"
            self.weatherView.humidityIndexLabel.text = "\(self.weatherViewModel.weather.humidity ?? 0)%"
            self.weatherView.visibilityIndexLabel.text = "\(self.weatherViewModel.weather.visibility ?? 0) m"
            self.weatherView.windIndexLabel.text = "\(self.weatherViewModel.weather.windStatus ?? 0) mph"
            self.weatherView.mainTempImageView.sd_setImage(with: self.weatherViewModel.weather.weatherIconUrl)
            self.weatherView.firstDay.tempLabel.text = "\(self.weatherViewModel.weather.temp1 ?? 0)°C"
            self.weatherView.secondDay.tempLabel.text = "\(self.weatherViewModel.weather.temp2 ?? 0)°C"
            self.weatherView.thirdDay.tempLabel.text = "\(self.weatherViewModel.weather.temp3 ?? 0)°C"
            self.weatherView.forthDay.tempLabel.text = "\(self.weatherViewModel.weather.temp4 ?? 0)°C"
            self.weatherView.fifthDay.tempLabel.text = "\(self.weatherViewModel.weather.temp5 ?? 0)°C"
            self.weatherView.firstDay.imageView.sd_setImage(with: self.weatherViewModel.weather.icon1)
            self.weatherView.secondDay.imageView.sd_setImage(with: self.weatherViewModel.weather.icon2)
            self.weatherView.thirdDay.imageView.sd_setImage(with: self.weatherViewModel.weather.icon3)
            self.weatherView.forthDay.imageView.sd_setImage(with: self.weatherViewModel.weather.icon4)
            self.weatherView.fifthDay.imageView.sd_setImage(with: self.weatherViewModel.weather.icon5)
            self.weatherView.firstDay.dayOfTheWeekLabel.text = self.weatherViewModel.weather.date1
            self.weatherView.secondDay.dayOfTheWeekLabel.text = self.weatherViewModel.weather.date2
            self.weatherView.thirdDay.dayOfTheWeekLabel.text = self.weatherViewModel.weather.date3
            self.weatherView.forthDay.dayOfTheWeekLabel.text = self.weatherViewModel.weather.date4
            self.weatherView.fifthDay.dayOfTheWeekLabel.text = self.weatherViewModel.weather.date5
        }
    }
    
    @objc fileprivate func handleSearch() {
        weatherViewModel.goBackToSearch()
    }
        
    fileprivate func setupViews() {
        view.addSubview(weatherView)
        weatherView.snp.makeConstraints { make in
            make.size.equalToSuperview()
        }
    }
    
    init(weatherViewModel: WeatherViewModelType) {
        self.weatherViewModel = weatherViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

