//
//  WeathersViewModel.swift
//  WiproDemoApp
//
//  Created by lei on 10/10/2018.
//  Copyright © 2018 lei. All rights reserved.
//

import RealmSwift
import RxSwift

class WeathersViewModel{

    static let city: String = "Dublin"
    let apiService: APIServiceProtocol
    private var _weathers: Variable<[WeatherCellViewModel]> = Variable([])
    var weathers : Observable<[WeatherCellViewModel]>{
        return _weathers.asObservable()
    }

    var errorGetDataFromServer: NSError?

    init(apiService: APIServiceProtocol = WeatherDataApiService(cityName: city)){
        self.apiService = apiService
        
        if let weatherArray = self.retrieveWeatherData() {
            for weather in weatherArray{
                _weathers.value.append(WeatherCellViewModel(weatherData: weather))
            }
        }
        else{
            self.getDataFromServer()
        }
    }
    
    func retrieveWeatherData() -> [Weather]?{
        
        let realm = try! Realm()
        let items: Results<Weather> = realm.objects(Weather.self)
        
        return items.count > 0 ? Array(items) : nil
    }
    
    func getDataFromServer(){
        
        self.apiService.getWeatherData(success: { [weak self] (weathers) in
            
            guard let self = self else{
                return
            }
            
            for weather in weathers.weather{
                self._weathers.value.append(WeatherCellViewModel(weatherData: weather))
            }
            
        }) { (error) in
            self.errorGetDataFromServer = error
            print("\(error)")
        }
    }
    
    
}
