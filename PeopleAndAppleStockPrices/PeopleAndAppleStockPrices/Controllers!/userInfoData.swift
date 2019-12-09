//
//  File.swift
//  PeopleAndAppleStockPrices
//
//  Created by Tiffany Obi on 12/5/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct AllUserInfoData: Decodable {
    let  results: [UserInfoData]
}

struct UserInfoData: Decodable {
    let gender: String
    let name: NameInfo
    let location: Location
    let email: String
    let cell : String
    let picture: Images
}

struct NameInfo: Decodable {
    let title: String
    let first: String
    let last: String
}

struct Location: Decodable {
    let street: String
    let city: String
    let state: String
    let postcode: String
}

struct Images: Decodable {
    let large: String
    let medium: String
    let thumbnail: String
}

extension AllUserInfoData {
    
    
    static func getUserInfo(from data: Data) -> [UserInfoData] {
        
        var allUserInfo = [UserInfoData]()
        
        guard let fileURL = Bundle.main.url(forResource: "userinfo", withExtension: "json") else {
            fatalError("could not locate file")
        }
        
        do {
            let data = try Data(contentsOf: fileURL)
            
            let arrayOfUserInfo = try JSONDecoder().decode(AllUserInfoData.self, from: data)
            
            allUserInfo = arrayOfUserInfo.results
        } catch {
            fatalError("content not found; \(error)")
        }
        
        return allUserInfo
    }
    
    
}
