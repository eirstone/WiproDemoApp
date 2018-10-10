//
//  City.swift
//  WiproDemoApp
//
//  Created by lei on 10/10/2018.
//  Copyright © 2018 lei. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper

class City: Object,Mappable {

//    id: 6940463,
//    name: "Altstadt",
//    country: "none"

    // MARK: Realm fields
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String? = nil
    @objc dynamic var country: String? = nil

    @objc dynamic var coord: Coord? = nil
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        country <- map["country"]
        coord <- map["coord"]

    }

}
