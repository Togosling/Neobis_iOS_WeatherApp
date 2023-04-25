//
//  Service.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Тагай Абдылдаев on 15/4/23.
//

import Foundation

class Service {
    
    static let shared = Service()
    
    //MARK: Generic
    
    func fetchCityData(city: String, completion: @escaping (CityGroup)->()) {
        let urlString = "http://api.openweathermap.org/geo/1.0/direct?q=\(city)&limit=5&appid=9179ff35255c8bb1407f79ae716cfe38"
        fetchGenericJsonData(urlString: urlString, completion: completion)
        
    }
    
    func fetchTempData(lat: Double, long: Double, completion: @escaping (WeatherGroup)->()) {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(long)&appid=9179ff35255c8bb1407f79ae716cfe38"
        
        fetchGenericJsonData(urlString: urlString, completion: completion)
        
    }
    
    func fetchTempDataForWeek(lat: Double, long: Double, completion: @escaping ()->() {
        let urlString = "api.openweathermap.org/data/2.5/forecast?lat=\(lat)&lon=\(long)&appid=9179ff35255c8bb1407f79ae716cfe38"
        
        fetchGenericJsonData(urlString: urlString, completion: completion)
        
    }
    
    func fetchGenericJsonData<T:Decodable> (urlString: String, completion: @escaping (T) -> ()) {
        
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print("failed to fetch", error)
            }
            guard let data = data else {return}
            
            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                completion(result)
        
            } catch {
                print("failed to decode json", error)
            }

        }.resume()
    }
}


