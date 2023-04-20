//
//  MainView.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Тагай Абдылдаев on 20/4/23.
//

import UIKit


class WeatherView: UIView {
    
    let searchButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "Search"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: "Montserrat-Regular", size: 14)
        label.textAlignment = .center
        label.text = "Today, May 7th, 2021"
        return label
    }()
    
    let cityLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: "Montserrat-Bold", size: 40)
        label.textAlignment = .center
        label.text = "Barcelona"
        return label
    }()
    
    let countryLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: "Montserrat-Regular", size: 20)
        label.textAlignment = .center
        label.text = "Spain"
        return label
    }()
    
    let tempeView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let mainTempImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "rain")
        return iv
    }()
    
    let tempLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont(name: "Montserrat-Light", size: 100)
        label.textAlignment = .center
        label.text = "10°C"
        return label
    }()
    
    let windLabel : UILabel = {
        let label = UILabel().createCategoryLabel(text: "Wind Status")
        return label
    }()
    let windIndexLabel : UILabel = {
        let label = UILabel().createIndexLabel(text: "7 mph")
        return label
    }()
    let visibilityLabel : UILabel = {
        let label = UILabel().createCategoryLabel(text: "Visibility")
        return label
    }()
    let visibilityIndexLabel : UILabel = {
        let label = UILabel().createIndexLabel(text: "6.4 miles")
        return label
    }()
    let humidityLabel : UILabel = {
        let label = UILabel().createCategoryLabel(text: "Humidity")
        return label
    }()
    let humidityIndexLabel : UILabel = {
        let label = UILabel().createIndexLabel(text: "85%")
        return label
    }()
    let airPressureLabel : UILabel = {
        let label = UILabel().createCategoryLabel(text: "Air Pressure")
        return label
    }()
    let airPressureIndexLabel : UILabel = {
        let label = UILabel().createIndexLabel(text: "998 mb")
        return label
    }()
    
    let nextweekView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let firstDay = DayTemp(frame: .zero, day: "Sunday", image: "rain", temp: "10° C")
    let secondDay = DayTemp(frame: .zero, day: "Monday", image: "rain", temp: "10° C")
    let thirdDay = DayTemp(frame: .zero, day: "Tuesday", image: "rain", temp: "10° C")
    let forthDay = DayTemp(frame: .zero, day: "Wednesday", image: "rain", temp: "10° C")
    let fifthDay = DayTemp(frame: .zero, day: "Thursday", image: "rain", temp: "10° C")
    
    let nextDaysLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont(name: "Montserrat-Bold", size: 14)
        label.textAlignment = .center
        label.text = "The Next 5 days"
        return label
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
    
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradient(view: self)
        setupViews()

    }
    
    fileprivate func setupViews() {
        
        addSubview(searchButton)
        searchButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(flexibleHeight(to: 80))
            make.trailing.equalToSuperview().offset(-(flexibleWidth(to: 30)))
        }
        
        let placeAndDateStackView = UIStackView(arrangedSubviews: [dateLabel,cityLabel,countryLabel])
        placeAndDateStackView.axis = .vertical
        placeAndDateStackView.spacing = 5
        
        addSubview(placeAndDateStackView)
        placeAndDateStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(flexibleHeight(to: 120))
        }
        addSubview(tempeView)
        tempeView.layer.cornerRadius = flexibleWidth(to: 120)
        tempeView.snp.makeConstraints { make in
            make.top.equalTo(placeAndDateStackView.snp.bottom).offset(flexibleHeight(to: 20))
            make.centerX.equalToSuperview()
            make.width.equalTo(flexibleWidth(to: 240))
            make.height.equalTo(flexibleHeight(to: 240))
        }
        addSubview(mainTempImageView)
        mainTempImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(tempeView.snp.top).offset(flexibleHeight(to: 5))
        }
        addSubview(tempLabel)
        tempLabel.snp.makeConstraints { make in
            make.center.equalTo(tempeView.snp.center)
        }
        addSubview(windLabel)
        windLabel.snp.makeConstraints { make in
            make.top.equalTo(tempeView.snp.bottom).offset(flexibleHeight(to: 30))
            make.leading.equalToSuperview().offset(flexibleWidth(to: 60))
        }
        addSubview(windIndexLabel)
        windIndexLabel.snp.makeConstraints { make in
            make.centerX.equalTo(windLabel.snp.centerX)
            make.top.equalTo(windLabel.snp.bottom).offset(flexibleHeight(to: 5))
        }
        addSubview(humidityLabel)
        humidityLabel.snp.makeConstraints { make in
            make.top.equalTo(windIndexLabel.snp.bottom).offset(flexibleHeight(to: 20))
            make.centerX.equalTo(windLabel.snp.centerX)
        }
        addSubview(humidityIndexLabel)
        humidityIndexLabel.snp.makeConstraints { make in
            make.top.equalTo(humidityLabel.snp.bottom).offset(flexibleHeight(to: 5))
            make.centerX.equalTo(humidityLabel.snp.centerX)
        }
        addSubview(visibilityLabel)
        visibilityLabel.snp.makeConstraints { make in
            make.top.equalTo(tempeView.snp.bottom).offset(flexibleHeight(to: 30))
            make.trailing.equalToSuperview().offset(-(flexibleWidth(to: 60)))
        }
        addSubview(visibilityIndexLabel)
        visibilityIndexLabel.snp.makeConstraints { make in
            make.centerX.equalTo(visibilityLabel.snp.centerX)
            make.top.equalTo(visibilityLabel.snp.bottom).offset(flexibleHeight(to: 5))
        }
        addSubview(airPressureLabel)
        airPressureLabel.snp.makeConstraints { make in
            make.top.equalTo(visibilityIndexLabel.snp.bottom).offset(flexibleHeight(to: 20))
            make.centerX.equalTo(visibilityLabel.snp.centerX)
        }
        addSubview(airPressureIndexLabel)
        airPressureIndexLabel.snp.makeConstraints { make in
            make.top.equalTo(airPressureLabel.snp.bottom).offset(flexibleHeight(to: 5))
            make.centerX.equalTo(airPressureLabel.snp.centerX)
        }
        addSubview(nextweekView)
        nextweekView.layer.cornerRadius = flexibleWidth(to: 60)
        nextweekView.snp.makeConstraints { make in
            make.top.equalTo(airPressureIndexLabel.snp.bottom).offset(flexibleHeight(to: 30))
            make.width.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        addSubview(nextDaysLabel)
        nextDaysLabel.snp.makeConstraints { make in
            make.top.equalTo(nextweekView.snp.top).offset(flexibleHeight(to: 60))
            make.leading.equalToSuperview().offset(flexibleWidth(to: 15))
        }
        
        let daysStackView = UIStackView(arrangedSubviews: [firstDay, secondDay, thirdDay, forthDay, fifthDay])
        daysStackView.axis = .horizontal
        daysStackView.spacing = 10
        daysStackView.distribution = .fillEqually
        addSubview(daysStackView)
        daysStackView.snp.makeConstraints { make in
            make.top.equalTo(nextDaysLabel.snp.bottom).offset(flexibleHeight(to: 15))
            make.leading.equalTo(nextDaysLabel.snp.leading)
            make.trailing.equalToSuperview().offset(-(flexibleWidth(to: 15)))
            make.height.equalTo(flexibleHeight(to: 100))
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
