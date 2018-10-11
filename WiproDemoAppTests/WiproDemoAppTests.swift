//
//  WiproDemoAppTests.swift
//  WiproDemoAppTests
//
//  Created by lei on 10/10/2018.
//  Copyright © 2018 lei. All rights reserved.
//

import XCTest
import RealmSwift

@testable import WiproDemoApp

class WiproDemoAppTests: XCTestCase {

    var mockWeatherdataApiService: MockWeatherdataApiService!
    var weathersViewModel: WeathersViewModel!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        
        mockWeatherdataApiService = MockWeatherdataApiService()
        weathersViewModel = WeathersViewModel(apiService: mockWeatherdataApiService)
        
        Realm.Configuration.defaultConfiguration.inMemoryIdentifier = "WiproDemoAppTests"
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()

        mockWeatherdataApiService = nil
        weathersViewModel = nil
    }

    //behavior test
    func test_getWeatherData() {
        // getting weather data
        weathersViewModel.getDataFromServer()

        // Assert
        XCTAssert(mockWeatherdataApiService.getWeatherDataCalled)
    }
    
    func test_getWeatherData_failure(){
        
        let domainName = "WiproDemo"
        let errorCode = 4333
        let errorMessage = "MockErrorMessage"
        let mockError = NSError(domain: domainName, code: errorCode, userInfo: ["error":errorMessage])
        
        weathersViewModel.getDataFromServer()
        mockWeatherdataApiService.failureHandler(mockError)
        
        guard let error = weathersViewModel.errorGetDataFromServer else{
            return XCTFail()
        }

        XCTAssertEqual(error.code, errorCode)
        XCTAssertEqual(error.domain, domainName)
        
        let errorVal = error.userInfo["error"] as! String
        XCTAssertEqual(errorVal, errorMessage)

    }
    
//    func test_getWeatherData_success(){
//
//        let weathers = StubWeathers.generateWeatherObject()
//        weathersViewModel.getDataFromServer()
//        mockWeatherdataApiService.successHandler(weathers!)
//
//        XCTAssertEqual(weathersViewModel._weathers.value.count, 1)
//    }
    
}
