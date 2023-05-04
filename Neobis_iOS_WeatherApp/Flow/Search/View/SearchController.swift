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
    
    fileprivate var searchViewModel: SearchViewModelType
    fileprivate let searchView = SearchView()
    fileprivate let hud: JGProgressHUD = {
        let hud = JGProgressHUD(style: .dark)
        hud.textLabel.text = "Looking for Weather"
        return hud
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.gradient(view: view)
        setupViews()
        searchView.searchButton.addTarget(self, action: #selector(handleSearch), for: .touchUpInside)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        hud.dismiss(animated: true)
    }
        
    @objc fileprivate func handleSearch() {
        hud.show(in: self.view)
        guard let searchCity = searchView.searchTextField.text else {return}
        searchViewModel.fetchCityData(city: searchCity)
    }
    
    fileprivate func setupViews() {
        view.addSubview(searchView)
        searchView.snp.makeConstraints { make in
            make.size.equalToSuperview()
        }
    }
    
    init(searchViewModel: SearchViewModelType){
        self.searchViewModel = searchViewModel
        super .init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

