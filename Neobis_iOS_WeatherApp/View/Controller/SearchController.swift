//
//  SearchController.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Тагай Абдылдаев on 19/4/23.
//

import UIKit
import SnapKit
import JGProgressHUD


class SearchController: UIViewController {
    
    fileprivate let searchViewModel: SearchViewModel
    fileprivate let searchView = SearchView()
    
    fileprivate let hud: JGProgressHUD = {
        let hud = JGProgressHUD(style: .dark)
        hud.textLabel.text = "Looking for weather"
        return hud
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.gradient(view: view)
        setupViews()
        searchView.searchButton.addTarget(self, action: #selector(handleSearch), for: .touchUpInside)
    }
        
    @objc fileprivate func handleSearch() {
        self.hud.show(in: self.view)
        guard let searchCity = searchView.searchTextField.text else {return}
        searchViewModel.searchCity = searchCity
        searchObserver()
    }
    
    fileprivate func searchObserver() {
        searchViewModel.bindableSearchWeather.bind {[weak self] weather in
            guard let weather = weather else {return}
            DispatchQueue.main.async {
                self?.hud.dismiss(animated: true)
                let weatherViewModel = WeatherViewModel(overallWeather: weather)
                let weatherViewController = WeatherViewController(weatherViewModel: weatherViewModel)
                weatherViewController.modalPresentationStyle = .fullScreen
                self?.present(weatherViewController, animated: true)
            }
        }
    }
        
    fileprivate func setupViews() {
        view.addSubview(searchView)
        searchView.snp.makeConstraints { make in
            make.size.equalToSuperview()
        }
    }
    
    init(searchViewModel: SearchViewModel){
        self.searchViewModel = searchViewModel
        super .init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

