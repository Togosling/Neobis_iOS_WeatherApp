//
//  SearchController.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Тагай Абдылдаев on 19/4/23.
//

import UIKit
import SnapKit


class SearchController: UIViewController {
    
    let searchView = SearchView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.gradient(view: view)
        setupViews()
        searchView.closeButton.addTarget(self, action: #selector(handleClose), for: .touchUpInside)
        searchView.searchButton.addTarget(self, action: #selector(handleSearch), for: .touchUpInside)
    }
    
    @objc func handleSearch() {
        guard let searchCity = searchView.searchTextField.text else {return}
        Service.shared.fetchCityData(city: searchCity) { cityGroup in
            guard let city = cityGroup.first else {return}
            Service.shared.fetchTempData(lat: city.lat, long: city.lon) { weatherGroup in
                print(weatherGroup.main.temp, weatherGroup.main.humidity, weatherGroup.main.pressure, weatherGroup.visibility, weatherGroup.weather?.first?.icon, weatherGroup.wind?.speed)
            }
        }
        
    }
    
    @objc func handleClose() {
        self.dismiss(animated: true)
    }
    
    fileprivate func setupViews() {
        view.addSubview(searchView)
        searchView.snp.makeConstraints { make in
            make.size.equalToSuperview()
        }
    }
}
