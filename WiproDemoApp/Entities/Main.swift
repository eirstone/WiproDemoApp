//
//  Main.swift
//  WiproDemoApp
//
//  Created by lei on 10/10/2018.
//  Copyright © 2018 lei. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper

class Main: Object, Mappable {

//    temp: 286.67,
//    temp_min: 281.556,
//    temp_max: 286.67,
//    pressure: 972.73,
//    sea_level: 1046.46,
//    grnd_level: 972.73,
//    humidity: 75,
//    temp_kf: 5.11
    
    // MARK: Realm fields
    @objc dynamic var temp: Double = 0.0
    @objc dynamic var temp_min: Double = 0.0
    @objc dynamic var temp_max: Double = 0.0
    @objc dynamic var pressure: Double = 0.0
    @objc dynamic var sea_level: Double = 0.0
    @objc dynamic var grnd_level: Double = 0.0
    @objc dynamic var humidity: Int = 0
    @objc dynamic var temp_kf: Double = 0.0

    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        temp <- map["temp"]
        temp_min <- map["temp_min"]
        temp_max <- map["temp_max"]
        pressure <- map["pressure"]
        sea_level <- map["sea_level"]
        grnd_level <- map["grnd_level"]
        humidity <- map["humidity"]
        temp_kf <- map["temp_kf"]
    }
}
