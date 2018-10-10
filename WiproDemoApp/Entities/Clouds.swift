//
//  Clouds.swift
//  WiproDemoApp
//
//  Created by lei on 10/10/2018.
//  Copyright © 2018 lei. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper

class Clouds: Object,Mappable {
    
    // MARK: Realm fields
    @objc dynamic var all: Double = 0.0
    
    //Impl. of Mappable protocol
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        all  <- map["all"]
    }
    
}
