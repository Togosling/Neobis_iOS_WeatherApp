//
//  ViewController.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Тагай Абдылдаев on 14/4/23.
//

import UIKit
import SnapKit


class MainViewController: UIViewController {
    
    let mainView = MainView()
    
    override func viewDidLoad() {
        super .viewDidLoad()
        
        setupViews()
        mainView.searchButton.addTarget(self, action: #selector(handleSearch), for: .touchUpInside)
    }
    
    @objc fileprivate func handleSearch() {
        let searchController = SearchController()
        searchController.modalPresentationStyle = .fullScreen
        present(searchController, animated: true)
    }
        
    fileprivate func setupViews() {
        view.addSubview(mainView)
        mainView.snp.makeConstraints { make in
            make.size.equalToSuperview()
        }
      
    }
}

