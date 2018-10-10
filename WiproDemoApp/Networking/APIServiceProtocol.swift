//
//  APIServiceProtocol.swift
//  WiproDemoApp
//
//  Created by lei on 10/10/2018.
//  Copyright © 2018 lei. All rights reserved.
//

import Foundation

typealias SuccessHandler = (_ weathers: Weathers) -> Void
typealias FailureHandler = (_ error: NSError) -> Void

protocol APIServiceProtocol {

    func getWeatherData(success: @escaping SuccessHandler, failure: @escaping FailureHandler )
}
