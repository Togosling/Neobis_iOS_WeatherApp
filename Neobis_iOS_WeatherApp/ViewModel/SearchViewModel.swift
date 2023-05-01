//
//  SearchViewModel.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Тагай Абдылдаев on 1/5/23.
//

import Foundation

protocol SearchViewModelType {
    
}

class SearchViewModel {
    
    var bindableSearchCity = Bindable<String>()
    
    var searchCity: String? {
        didSet {
            bindableSearchCity.value = searchCity
        }
    }
}
