//
//  ViewController.swift
//  WiproDemoApp
//
//  Created by lei on 10/10/2018.
//  Copyright © 2018 lei. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private let cellIdentifier = "weatherCell"
    private let disposeBag = DisposeBag()
    private var weathersViewModel: WeathersViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.weathersViewModel = WeathersViewModel()
        self.setupTableView()
    }

    //MARK: - Binding
    func setupTableView() {
        
        tableView.rowHeight = 70
        tableView.estimatedRowHeight = 70
        
        //binding
        weathersViewModel.weathers
            .bind(to: tableView.rx.items(cellIdentifier: self.cellIdentifier, cellType: WeatherTableViewCell.self))  { row, weatherCellModel, cell in
                
                cell.setupWeather(weatherCellModel)
                
            }.disposed(by: disposeBag)
    }
    
}

