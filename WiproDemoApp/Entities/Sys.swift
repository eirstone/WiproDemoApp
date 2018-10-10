//
//  Sys.swift
//  WiproDemoApp
//
//  Created by lei on 10/10/2018.
//  Copyright © 2018 lei. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper

class Sys: Object , Mappable{
    
//    pod: "d"
    // MARK: Realm fields
    @objc dynamic var pod: String? = nil
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        pod    <- map["pod"]
    }
}
