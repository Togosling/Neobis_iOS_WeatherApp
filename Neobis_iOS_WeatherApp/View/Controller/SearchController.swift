//
//  SearchController.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Тагай Абдылдаев on 19/4/23.
//

import UIKit
import SnapKit


class SearchController: UIViewController {
    
    var weatherViewModel: WeatherViewModel?
    fileprivate let searchView = SearchView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.gradient(view: view)
        setupViews()
        searchView.closeButton.addTarget(self, action: #selector(handleClose), for: .touchUpInside)
        searchView.searchButton.addTarget(self, action: #selector(handleSearch), for: .touchUpInside)
    }
    
    @objc fileprivate func handleSearch() {
        guard let search = searchView.searchTextField.text else {return}
        weatherViewModel?.fetchCityData(city: search)
        self.dismiss(animated: true)
    }
    
    @objc fileprivate func handleClose() {
        self.dismiss(animated: true)
    }
    
    fileprivate func setupViews() {
        view.addSubview(searchView)
        searchView.snp.makeConstraints { make in
            make.size.equalToSuperview()
        }
    }
}

