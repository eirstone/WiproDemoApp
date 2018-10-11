//
//  StubWeathers.swift
//  WiproDemoAppTests
//
//  Created by lei on 11/10/2018.
//  Copyright © 2018 lei. All rights reserved.
//

import Foundation
import RealmSwift

@testable import WiproDemoApp

class StubWeathers {

    static func generateWeatherObject() -> Weathers?{
        
//        let testRealmURL = URL(fileURLWithPath: "WiproRealmTest")
//        
//        let config = Realm.Configuration(fileURL: testRealmURL)
        let testRealm = try! Realm()
        let jsonData = getMockJson().data(using: .utf8)!
        
        let object = try! JSONSerialization.jsonObject(with: jsonData) as! [String: Any]
        try! testRealm.write {
            testRealm.create(Weathers.self, value: object, update: true)
        }
        
        let item: Weathers = testRealm.objects(Weathers.self).filter("cod = '999'").first!
        
        return item

    }
    
    static private func getMockJson() -> String{
        return "{\"cod\": \"999\",\"message\": 0.0032,\"cnt\": 36,\"list\": [{\"dt\": 1487246400,\"main\": {\"temp\": 286.67,\"temp_min\": 281.556,\"temp_max\": 286.67,\"pressure\": 972.73,\"sea_level\": 1046.46,\"grnd_level\": 972.73,\"humidity\": 75,\"temp_kf\": 5.11},\"weather\": [{\"id\": 800,\"main\": \"Clear\",\"description\": \"clear sky\",\"icon\": \"01d\"}],\"clouds\": {\"all\": 0},\"wind\": {\"speed\": 1.81,\"deg\": 247.501},\"sys\": {\"pod\": \"d\"},\"dt_txt\": \"2017-02-16 12:00:00\"}],\"city\": {\"id\": 6940463,\"name\": \"Altstadt\",\"coord\": {\"lat\": 48.137,\"lon\": 11.5752},\"country\": \"none\"}}"
    }
}
