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
    
    
func getOpenAverage(monthStocks: [AppleInfo]) -> String {
        var totalSum: Double = 0
    var average: Double = 0
        for month in monthStocks {
        
            totalSum += month.open
        }
   average = totalSum / Double(monthStocks.count)
    let fixedString = String(format: "%.2f",average)
        return fixedString
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let stockInfo = segue.destination as? AppleStockDetailViewController,
            let indexPath = tableView.indexPathForSelectedRow else {
                fatalError("verify class name in the identity insepector")
        }
        
        let info = appleStocks[indexPath.section][indexPath.row]
        stockInfo.info = info
    }
    
}

extension AppleStocksViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        appleStocks[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let stockCell = tableView.dequeueReusableCell(withIdentifier: "stockCell", for: indexPath)
        
        let stockInfo = appleStocks[indexPath.section][indexPath.row]
        
        stockCell.textLabel?.text = stockInfo.label
        return stockCell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        appleStocks.count
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
      
        let thisLabel = appleStocks[section].first?.label
        var newTitle = thisLabel?.components(separatedBy: " ")
        newTitle?.remove(at: 1)
        let finalTitle = newTitle?.joined(separator: " '")
        let average = getOpenAverage(monthStocks:appleStocks[section] )
        
        return "\(finalTitle ?? " ") -------> Opening Average: \(average) "
    }
    
}
