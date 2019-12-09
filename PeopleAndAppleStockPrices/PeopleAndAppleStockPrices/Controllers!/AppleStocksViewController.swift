//
//  AppleStocksViewController.swift
//  PeopleAndAppleStockPrices
//
//  Created by Tiffany Obi on 12/6/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class AppleStocksViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var appleStocks = [[AppleInfo]]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        tableView.dataSource = self
      
    }
    
    func loadData () {
       
        appleStocks = AppleInfo.getSections()
    }
    

    
}

extension AppleStocksViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        appleStocks[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let stockCell = tableView.dequeueReusableCell(withIdentifier: "stockCell", for: indexPath)
        
        let stockInfo = appleStocks[indexPath.section][indexPath.row]
        
        stockCell.textLabel?.text = stockInfo.date
        return stockCell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        appleStocks.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return appleStocks[section].first?.date
    }
    
}
