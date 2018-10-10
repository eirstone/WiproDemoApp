//
//  Coord.swift
//  WiproDemoApp
//
//  Created by lei on 10/10/2018.
//  Copyright © 2018 lei. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper

class Coord: Object,Mappable {
    
//    lat: 48.137,
//    lon: 11.5752
    // MARK: Realm fields
    @objc dynamic var lon: Double = 0.0
    @objc dynamic var lat: Double = 0.0
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        lon <- map["lon"]
        lat <- map["lat"]
    }
    
}
