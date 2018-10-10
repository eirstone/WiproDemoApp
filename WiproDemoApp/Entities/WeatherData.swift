//
//  WeatherData.swift
//  WiproDemoApp
//
//  Created by lei on 10/10/2018.
//  Copyright © 2018 lei. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper

class WeatherData: Object, Mappable {

//    id: 800,
//    main: "Clear",
//    description: "clear sky",
//    icon: "01d"
    
    @objc dynamic var id: Int = 0
    @objc dynamic var main: String? = nil
    @objc dynamic var desc: String? = nil
    @objc dynamic var icon: String? = nil
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id    <- map["id"]
        main  <- map["main"]
        desc  <- map["description"]
        icon  <- map["icon"]
    }
}
