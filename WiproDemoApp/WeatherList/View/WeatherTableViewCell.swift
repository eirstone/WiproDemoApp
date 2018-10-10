//
//  WeatherTableViewCell.swift
//  WiproDemoApp
//
//  Created by lei on 10/10/2018.
//  Copyright © 2018 lei. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class WeatherTableViewCell: UITableViewCell {

    let disposeBag = DisposeBag()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupWeather(_ weatherVM: WeatherCellViewModel) {
        
        //title
        self.textLabel?.text = weatherVM.getTitle()

        //subtitle
        self.detailTextLabel?.text = weatherVM.getSubtitleString()

        //image
        guard let urlString = weatherVM.getWeatherImage(), let url = URL(string: urlString) else {
            return
        }
        
        URLSession.shared.rx.response(request: URLRequest(url: url)).subscribe { event in
            
            if let element = event.element{
                DispatchQueue.main.async {
                    self.imageView?.image = UIImage(data: element.data)
                    self.setNeedsLayout()
                }
            }
            }.disposed(by: disposeBag)
    }
}
