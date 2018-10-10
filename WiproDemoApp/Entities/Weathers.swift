//
//  Weathers.swift
//  WiproDemoApp
//
//  Created by lei on 10/10/2018.
//  Copyright © 2018 lei. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper


class Weathers: Object, Mappable {

//    cod: "200",
//    message: 0.0032,
//    cnt: 36,
    
    // MARK: Realm fields
    let weatherId = RealmOptional<Int>()
    
    @objc dynamic var cod: String? = nil
    @objc dynamic var message: Double = 0
    @objc dynamic var cnt: Int = 0
    @objc dynamic var city: City? = nil

    let weather = List<Weather>()

    override static func primaryKey() -> String? {
        return "weatherId"
    }
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        cod <- map["cod"]
        message <- map["message"]
        city <- map["city"]
        cnt <- map["cnt"]

        var weather: [Weather]?
        weather <- map["list"]
        if let weather = weather {
            for weatherTemp in weather {
                self.weather.append(weatherTemp)
            }
        }
        
    }
    
    static func url(city: String)->String {
        return "https://samples.openweathermap.org/data/2.5/forecast?q=\(city)&appid=6cb67f8e79ff6967e5970d43f468e344"
    }
}
