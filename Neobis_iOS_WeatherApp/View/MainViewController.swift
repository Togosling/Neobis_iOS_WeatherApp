//
//  ViewController.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Тагай Абдылдаев on 14/4/23.
//

import UIKit
import SnapKit

let textField = UITextField()
let cityLabel = UILabel()
let tempLabel = UILabel()
let searchButton = UIButton(type: .system)
var lat: Double?
var long: Double?

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        cityLabel.text = "City"
        cityLabel.textAlignment = .center
        view.addSubview(cityLabel)
        cityLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        tempLabel.text = "Temp"
        tempLabel.textAlignment = .center
        view.addSubview(tempLabel)
        tempLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(cityLabel.snp.bottom).offset(40)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        textField.backgroundColor = .lightGray
        view.addSubview(textField)
        textField.snp.makeConstraints { make in
            make.bottom.equalTo(cityLabel.snp.top).offset(-40)
            make.width.equalTo(200)
            make.centerX.equalToSuperview()
        }
        
        searchButton.setTitle("Search", for: .normal)
        view.addSubview(searchButton)
        searchButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(textField.snp.bottom).offset(10)
            make.width.equalTo(80)
        }
        
        searchButton.addTarget(self, action: #selector(handleSearch), for: .touchUpInside)
        
    }
    
    @objc func handleSearch() {
//        print(textField.text)
        Service.shared.fetchCityData(city: textField.text ?? "") { city in
            DispatchQueue.main.async {
                cityLabel.text = city.first?.name
                Service.shared.fetchTempData(lat: city.first!.lat, long: city.first!.lon) { weather in
                    DispatchQueue.main.async {
                        tempLabel.text = String(weather.main.temp!)
                        self.reloadInputViews()
                    }
                }
                self.reloadInputViews()
            }
        }
    }
}

