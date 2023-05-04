//
//  DayTemp.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Тагай Абдылдаев on 19/4/23.
//

import UIKit

class DayTemp: UIView {
    
    var dayOfTheWeekLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont(name: "Montserrat-Medium", size: 10)
        label.textAlignment = .center
        return label
    }()
    
    var borderView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.833, green: 0.833, blue: 0.833, alpha: 1).cgColor
        view.layer.cornerRadius = 20
        return view
    }()
    
    var imageView: UIImageView = {
        let iv = UIImageView()
        return iv
    }()
    
    var tempLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont(name: "Montserrat-Regular", size: 12)
        label.textAlignment = .center
        return label
    }()
    
    init(frame: CGRect, day: String, image: String, temp: String) {
        super .init(frame: frame)
        
        dayOfTheWeekLabel.text = day
        imageView.image = UIImage(named: image)
        tempLabel.text = temp
        setupViews()
        setupConstraints()
    }
    
    fileprivate func setupViews() {
        addSubview(dayOfTheWeekLabel)
        addSubview(borderView)
        addSubview(imageView)
        addSubview(tempLabel)
    }
    fileprivate func setupConstraints() {
        dayOfTheWeekLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
        }
        borderView.snp.makeConstraints { make in
            make.top.equalTo(dayOfTheWeekLabel.snp.bottom).offset(2)
            make.width.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        imageView.snp.makeConstraints { make in
            make.top.equalTo(borderView.snp.top).offset(10)
            make.height.equalTo(26)
            make.width.equalTo(26)
            make.centerX.equalToSuperview()
        }
        tempLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(4)
            make.centerX.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
