//
//  Wind.swift
//  WiproDemoApp
//
//  Created by lei on 10/10/2018.
//  Copyright © 2018 lei. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper

class Wind: Object, Mappable {
    
//    speed: 1.81,
//    deg: 247.501
    // MARK: Realm fields
    @objc dynamic var speed: Double = 0.0
    @objc dynamic var deg: Double = 0.0
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        speed   <- map["speed"]
        deg     <- map["deg"]
    }
    
}
