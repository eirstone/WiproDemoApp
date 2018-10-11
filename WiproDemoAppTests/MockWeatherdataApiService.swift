//
//  MockWeatherdataApiService.swift
//  WiproDemoAppTests
//
//  Created by lei on 11/10/2018.
//  Copyright © 2018 lei. All rights reserved.
//

import Foundation
@testable import WiproDemoApp

class MockWeatherdataApiService: APIServiceProtocol {

    var getWeatherDataCalled = false
    
    var successHandler: SuccessHandler!
    var failureHandler: FailureHandler!
    
    func getWeatherData(success: @escaping SuccessHandler, failure: @escaping FailureHandler ){
        getWeatherDataCalled = true
        self.successHandler = success
        self.failureHandler = failure
    }
    
    func getWeatherDataSuccess(){
        self.successHandler(Weathers(JSONString: "")!)
    }
    
    func getWeatherDataFailure(error: NSError){
        self.failureHandler(error)
    }
}
