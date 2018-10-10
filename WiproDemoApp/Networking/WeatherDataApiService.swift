//
//  WeatherDataApi.swift
//  WiproDemoApp
//
//  Created by lei on 10/10/2018.
//  Copyright © 2018 lei. All rights reserved.
//

import AlamofireObjectMapper
import Alamofire
import RealmSwift

class WeatherDataApiService: APIServiceProtocol {
    
    let cityName: String!
    
    init(cityName: String) {
        self.cityName = cityName
    }
    
    func getWeatherData(success: @escaping SuccessHandler, failure: @escaping FailureHandler ){
        
        let url = Weathers.url(city: cityName)
        
        Alamofire.request(url).responseObject { (response: DataResponse<Weathers>) in
            
            switch response.result{
            case .success(let weathers):
                do {
                    let realm = try Realm()
                    try realm.write {
                        realm.add(weathers, update: true)
                    }
                    
                    success(weathers)
                } catch let error as NSError {
                    failure(error)
                }
                
            case .failure(let error as NSError):
                failure(error)
            }
        }
    }
    
}
