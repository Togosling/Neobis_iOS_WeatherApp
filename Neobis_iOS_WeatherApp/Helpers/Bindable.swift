//
//  Bindable.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Тагай Абдылдаев on 24/4/23.
//

import Foundation

class Bindable<T> {
    var value: T? {
        didSet {
            observer?(value)
        }
    }
    
    var observer: ((T?)->())?
    
    func bind(observer: @escaping (T?) ->()) {
        self.observer = observer
    }
    
}
