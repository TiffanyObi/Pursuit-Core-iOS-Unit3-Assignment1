//
//  AppleStockInfo.swift
//  PeopleAndAppleStockPrices
//
//  Created by Tiffany Obi on 12/6/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct AppleInfo: Decodable {
    let date : String
    let open : Double
    let uOpen : Double
    let change : Double
    let label : String
    let close : Double
    
    static func getStocks () -> [AppleInfo] {
           var stocks = [AppleInfo]()
        
           guard let fileURL = Bundle.main.url(forResource: "applstockinfo", withExtension: "json") else {
               fatalError("could not locate file")
           }
           
           do {
               let data = try Data(contentsOf: fileURL)
               
               let arrayOfStockInfo = try JSONDecoder().decode([AppleInfo].self, from: data)
            stocks = arrayOfStockInfo
           } catch {
               fatalError("content not found; \(error)")
           }
        
        return stocks
        
    }
    static func getSections() -> [[AppleInfo]] {
        
        let stocks = getStocks()
        
            
            var monthLabel = Set<String>()
            
            for stock in stocks {
                
                var monthYear = stock.label
                var mYear = monthYear.components(separatedBy: " ")
                mYear.remove(at: 1)
                monthYear = mYear.joined()
                monthLabel.insert(monthYear)
            }
            
            var sectionsArr = Array(repeating: [AppleInfo](), count: monthLabel.count)
        print(monthLabel.count)
            var currentIndex = 0
            
            var currentMonth = stocks.first?.label.components(separatedBy: " ").first ?? ""
            
    
            
            for stock in stocks {
                let month = stock.label.components(separatedBy: " ").first ?? ""
                
                if month == currentMonth {
                    sectionsArr[currentIndex].append(stock)
                    
                } else {
                    currentIndex += 1
                    currentMonth = stock.label.components(separatedBy: " ").first ?? ""
                    sectionsArr[currentIndex].append(stock)
                }
            }
            
           return sectionsArr
       }
    
}

