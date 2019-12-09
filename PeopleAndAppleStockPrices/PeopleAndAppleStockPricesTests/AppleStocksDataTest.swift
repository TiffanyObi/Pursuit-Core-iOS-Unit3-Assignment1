//
//  AppleStocksDataTest.swift
//  PeopleAndAppleStockPricesTests
//
//  Created by Tiffany Obi on 12/6/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import XCTest
@testable import PeopleAndAppleStockPrices

class AppleStocksDataTest: XCTestCase {
    
var filename = "applstockinfo"
var ext = "json"
    
   func testFuncReadAppleStockData () {
        
    let data = getData()
    
    XCTAssertNotNil(data)
    }
    
    
    func testParseDataToStockArray() {
        
       // let data = getData()
        
        let stockInfo = AppleInfo.getSections()
     //   print(stockInfo.count)
        XCTAssertGreaterThan(stockInfo.count, 0, "Stock info count :\(stockInfo.count) is not greater then 0.")
    }
}

extension AppleStocksDataTest {
    
    func getData() -> Data {
        
        let data = Bundle.readRawJSONData(filename: filename, ext: ext)
        return data
    }
}
