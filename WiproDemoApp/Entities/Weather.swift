//
//  Weather.swift
//  WiproDemoApp
//
//  Created by lei on 10/10/2018.
//  Copyright © 2018 lei. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper

class Weather: Object, Mappable {

    // MARK: Realm fields
    @objc dynamic var dt: Int = 0
    @objc dynamic var dt_txt: String? = nil

    let weatherData = List<WeatherData>()
    @objc dynamic var main: Main? = nil
    @objc dynamic var wind: Wind? = nil
    @objc dynamic var clouds: Clouds? = nil
    @objc dynamic var sys: Sys? = nil
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        dt <- map["dt"]
        dt_txt <- map["dt_txt"]
        
        var weatherData: [WeatherData]?
        weatherData <- map["weather"]
        if let weatherData = weatherData {
            for weatherDataTemp in weatherData {
                self.weatherData.append(weatherDataTemp)
            }
        }
        
        main <- map["main"]
        wind <- map["wind"]
        clouds <- map["clouds"]
        sys <- map["sys"]
    }
}
