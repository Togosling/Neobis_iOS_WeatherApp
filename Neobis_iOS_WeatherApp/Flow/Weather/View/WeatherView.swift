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
    
    var dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: "Montserrat-Regular", size: 14)
        label.textAlignment = .center
        label.text = "Today, May 7th, 2021"
        return label
    }()
    
    var cityLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: "Montserrat-Bold", size: 40)
        label.textAlignment = .center
        label.text = "Barcelona"
        return label
    }()
    
    var countryLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: "Montserrat-Regular", size: 20)
        label.textAlignment = .center
        label.text = "Spain"
        return label
    }()
    
    fileprivate var tempView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    var mainTempImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "rain")
        return iv
    }()
    
    var tempLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont(name: "Montserrat-Light", size: 100)
        label.textAlignment = .center
        label.text = "10°C"
        return label
    }()
    
    fileprivate let windLabel : UILabel = {
        let label = UILabel().createCategoryLabel(text: "Wind Status")
        return label
    }()
    var windIndexLabel : UILabel = {
        let label = UILabel().createIndexLabel(text: "7 mph")
        return label
    }()
    fileprivate let visibilityLabel : UILabel = {
        let label = UILabel().createCategoryLabel(text: "Visibility")
        return label
    }()
    var visibilityIndexLabel : UILabel = {
        let label = UILabel().createIndexLabel(text: "6.4 miles")
        return label
    }()
    fileprivate let humidityLabel : UILabel = {
        let label = UILabel().createCategoryLabel(text: "Humidity")
        return label
    }()
    var humidityIndexLabel : UILabel = {
        let label = UILabel().createIndexLabel(text: "85%")
        return label
    }()
    fileprivate let airPressureLabel : UILabel = {
        let label = UILabel().createCategoryLabel(text: "Air Pressure")
        return label
    }()
    var airPressureIndexLabel : UILabel = {
        let label = UILabel().createIndexLabel(text: "998 mb")
        return label
    }()
    
    fileprivate let nextweekView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    var firstDay = DayTemp(frame: .zero, day: "Sunday", image: "rain", temp: "10° C")
    var secondDay = DayTemp(frame: .zero, day: "Monday", image: "rain", temp: "10° C")
    var thirdDay = DayTemp(frame: .zero, day: "Tuesday", image: "rain", temp: "10° C")
    var forthDay = DayTemp(frame: .zero, day: "Wednesday", image: "rain", temp: "10° C")
    var fifthDay = DayTemp(frame: .zero, day: "Thursday", image: "rain", temp: "10° C")
    
    fileprivate let nextDaysLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont(name: "Montserrat-Bold", size: 14)
        label.textAlignment = .center
        label.text = "The Next 5 days"
        return label
    }()
    
    fileprivate lazy var placeAndDateStackView: UIStackView = {
        let placeAndDateStackView = UIStackView(arrangedSubviews: [dateLabel,cityLabel,countryLabel])
        placeAndDateStackView.axis = .vertical
        placeAndDateStackView.spacing = 5
        return placeAndDateStackView
    }()
    
    fileprivate lazy var daysStackView: UIStackView = {
        let daysStackView = UIStackView(arrangedSubviews: [firstDay, secondDay, thirdDay, forthDay, fifthDay])
        daysStackView.axis = .horizontal
        daysStackView.spacing = 10
        daysStackView.distribution = .fillEqually
        return daysStackView
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
    
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradient(view: self)
        setupViews()
        setupConstraints()
    }
    
    fileprivate func setupViews() {
        addSubview(searchButton)
        addSubview(placeAndDateStackView)
        addSubview(tempView)
        addSubview(mainTempImageView)
        addSubview(tempLabel)
        addSubview(windLabel)
        addSubview(windIndexLabel)
        addSubview(humidityLabel)
        addSubview(humidityIndexLabel)
        addSubview(visibilityLabel)
        addSubview(visibilityIndexLabel)
        addSubview(airPressureLabel)
        addSubview(airPressureIndexLabel)
        addSubview(nextweekView)
        addSubview(nextDaysLabel)
        addSubview(daysStackView)
        tempView.layer.cornerRadius = flexibleWidth(to: 120)
        nextweekView.layer.cornerRadius = flexibleWidth(to: 60)
    }
    fileprivate func setupConstraints() {
        searchButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(flexibleHeight(to: 80))
            make.trailing.equalToSuperview().offset(-(flexibleWidth(to: 30)))
        }
        placeAndDateStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(flexibleHeight(to: 120))
        }
        tempView.snp.makeConstraints { make in
            make.top.equalTo(placeAndDateStackView.snp.bottom).offset(flexibleHeight(to: 20))
            make.centerX.equalToSuperview()
            make.width.equalTo(flexibleWidth(to: 240))
            make.height.equalTo(flexibleHeight(to: 240))
        }
        mainTempImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(tempView.snp.top).offset(flexibleHeight(to: 5))
            make.width.height.equalTo(flexibleWidth(to: 50))
        }
        tempLabel.snp.makeConstraints { make in
            make.center.equalTo(tempView.snp.center)
        }
        windLabel.snp.makeConstraints { make in
            make.top.equalTo(tempView.snp.bottom).offset(flexibleHeight(to: 30))
            make.leading.equalToSuperview().offset(flexibleWidth(to: 60))
        }
        windIndexLabel.snp.makeConstraints { make in
            make.centerX.equalTo(windLabel.snp.centerX)
            make.top.equalTo(windLabel.snp.bottom).offset(flexibleHeight(to: 5))
        }
        humidityLabel.snp.makeConstraints { make in
            make.top.equalTo(windIndexLabel.snp.bottom).offset(flexibleHeight(to: 20))
            make.centerX.equalTo(windLabel.snp.centerX)
        }
        humidityIndexLabel.snp.makeConstraints { make in
            make.top.equalTo(humidityLabel.snp.bottom).offset(flexibleHeight(to: 5))
            make.centerX.equalTo(humidityLabel.snp.centerX)
        }
        visibilityLabel.snp.makeConstraints { make in
            make.top.equalTo(tempView.snp.bottom).offset(flexibleHeight(to: 30))
            make.trailing.equalToSuperview().offset(-(flexibleWidth(to: 60)))
        }
        visibilityIndexLabel.snp.makeConstraints { make in
            make.centerX.equalTo(visibilityLabel.snp.centerX)
            make.top.equalTo(visibilityLabel.snp.bottom).offset(flexibleHeight(to: 5))
        }
        airPressureLabel.snp.makeConstraints { make in
            make.top.equalTo(visibilityIndexLabel.snp.bottom).offset(flexibleHeight(to: 20))
            make.centerX.equalTo(visibilityLabel.snp.centerX)
        }
        airPressureIndexLabel.snp.makeConstraints { make in
            make.top.equalTo(airPressureLabel.snp.bottom).offset(flexibleHeight(to: 5))
            make.centerX.equalTo(airPressureLabel.snp.centerX)
        }
        nextweekView.snp.makeConstraints { make in
            make.top.equalTo(airPressureIndexLabel.snp.bottom).offset(flexibleHeight(to: 30))
            make.width.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        nextDaysLabel.snp.makeConstraints { make in
            make.top.equalTo(nextweekView.snp.top).offset(flexibleHeight(to: 60))
            make.leading.equalToSuperview().offset(flexibleWidth(to: 15))
        }
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
