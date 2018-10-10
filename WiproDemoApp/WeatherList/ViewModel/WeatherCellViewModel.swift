//
//  WeatherCellViewModel.swift
//  WiproDemoApp
//
//  Created by lei on 10/10/2018.
//  Copyright © 2018 lei. All rights reserved.
//

import RxSwift
import RxCocoa

class WeatherCellViewModel {

    let weather : Weather!
    
    var driver: Driver<UIImage>!

    init(weatherData: Weather) {
        self.weather = weatherData
    }
    
    func getTitle() -> String{
        
        var title: String = ""
        
        //date
        if let date = self.weather.dt_txt{
            title = "\(date.getHumanReadableDateString())"
        }

        //weather
        for data in self.weather.weatherData{
            
            if let main = data.main{
                title += ", \(main)"
            }
            
            break;
        }
        
        return title
    }
    
    func getSubtitleString() -> String{
        
        var subtitle: String = ""
        let temperature = self.kevinToCelius()
        
        if let temp = temperature {
            subtitle = "Low: \(temp.lowTemp), High: \(temp.highTemp)"
        }

        return subtitle
    }
    
    func getWeatherImage() -> String?{
        
        var weatherIcon: String?
        for data in self.weather.weatherData{
            
            if let icon = data.icon{
                weatherIcon = icon
            }
            
            break;
        }
        
        guard let icon = weatherIcon else {
            return nil
        }
        
        return "http://openweathermap.org/img/w/\(icon).png"
    }
    
    private func kevinToCelius() -> (lowTemp:String,highTemp:String)?{
        
        guard let temp = self.weather.main else{
            return nil
        }
        
        let lowCelsius = temp.temp_min - 273.15
        let highCelsius = temp.temp_max - 273.15
        
        return (String(format: "%.0f°C", lowCelsius),String(format: "%.0f°C", highCelsius))
    }
    
}
