//
//  PeopleAndAppleStockPricesTests.swift
//  PeopleAndAppleStockPricesTests
//
//  Created by Tiffany Obi on 12/5/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import XCTest
@testable import PeopleAndAppleStockPrices


class PeopleAndAppleStockPricesUITests: XCTestCase {

    var filename = "userinfo"
    var ext = "json"
    

    func testReadDataFromUserInfoData() {
        
        
        let data = getRawData()
        
                XCTAssertNotNil(data)
    }
     
    
    func testParseDataToArrayOfUserInfo() {
        
        let data = getRawData()
        
        let userInfo = AllUserInfoData.getUserInfo(from: data)
        
        XCTAssertGreaterThan(userInfo.count, 0, "userInfo.count is \(userInfo) and shoule be greater than 0")
    }
    
    func testFirstNameInUserData () {
        let data = getRawData()
        let expectedName = "eugene"
        let allNames = AllUserInfoData.getUserInfo(from: data)
        
        let firstName = allNames.first!
        
        XCTAssertEqual(expectedName, firstName.name.first, "expectedName: \(expectedName) and  \(firstName) should be the name")
    }
    
}









extension PeopleAndAppleStockPricesUITests {
    
    func getRawData() -> Data {
       
        let data = Bundle.readRawJSONData(filename: filename, ext: ext)
        
        return data
    }
}
