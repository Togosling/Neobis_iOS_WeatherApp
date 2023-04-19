//
//  SearchController.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Тагай Абдылдаев on 19/4/23.
//

import UIKit
import SnapKit


class SearchController: UIViewController {
    
    let whiteView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 50
        return view
    }()
    
    let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "close"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    let searchTextField: CustomTextField = {
        let textfield = CustomTextField()
        textfield.placeholder = "SEARCH LOCATION"
        let attributes = [NSAttributedString.Key.font: UIFont(name: "Montserrat-Regular", size: 14), NSAttributedString.Key.foregroundColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1)]
        textfield.attributedPlaceholder = NSAttributedString(string: "SEARCH LOCATION", attributes: attributes as [NSAttributedString.Key : Any])
        textfield.backgroundColor = UIColor(red: 237/255, green: 237/255, blue: 237/255, alpha: 1)
        textfield.layer.cornerRadius = 20
        return textfield
    }()
    
    let searchButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Search", for: .normal)
        button.titleLabel?.font = UIFont(name: "Montserrat-Bold", size: 14)
        button.backgroundColor = UIColor(red: 237/255, green: 237/255, blue: 237/255, alpha: 1)
        button.tintColor = .black
        button.layer.cornerRadius = 10
        return button
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.gradient(view: view)
        setupViews()
        closeButton.addTarget(self, action: #selector(handleClose), for: .touchUpInside)
    }
    @objc func handleClose() {
        self.dismiss(animated: true)
    }
    
    fileprivate func setupViews() {
        view.addSubview(whiteView)
        whiteView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(flexibleHeight(to: 70))
            make.width.equalToSuperview()
            make.height.equalTo(flexibleHeight(to: 350))
        }
        view.addSubview(closeButton)
        closeButton.snp.makeConstraints { make in
            make.top.equalTo(whiteView.snp.top).offset(flexibleHeight(to: 30))
            make.trailing.equalTo(whiteView.snp.trailing).offset(-(flexibleWidth(to: 30)))
        }
        view.addSubview(searchTextField)
        searchTextField.snp.makeConstraints { make in
            make.top.equalTo(closeButton.snp.bottom).offset(flexibleHeight(to: 30))
            make.width.equalTo(flexibleWidth(to: 300))
            make.height.equalTo(flexibleHeight(to: 50))
            make.centerX.equalToSuperview()
        }
        view.addSubview(searchButton)
        searchButton.snp.makeConstraints { make in
            make.top.equalTo(searchTextField.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.height.equalTo(flexibleHeight(to: 30))
            make.width.equalTo(flexibleWidth(to: 150))
        }
    }
}
