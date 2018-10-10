//
//  String+humanReadableDateString.swift
//  WiproDemoApp
//
//  Created by lei on 10/10/2018.
//  Copyright © 2018 lei. All rights reserved.
//

import UIKit

extension String {

    func getHumanReadableDateString() -> String{
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM d, h:mm a"
        
        let date: Date? = dateFormatter.date(from: self)
        return dateFormatterPrint.string(from: date!);
    }
}
