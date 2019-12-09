//
//  Bundles+Extensions.swift
//  PeopleAndAppleStockPrices
//
//  Created by Tiffany Obi on 12/5/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

extension Bundle {
    
    class func readRawJSONData(filename: String, ext: String) -> Data {
        
        guard let fileURL = Bundle.main.url(forResource: filename, withExtension: ext) else {
           fatalError("could not locate file: \(filename) \(ext) not found")
        }
        
        var data: Data!
        
        do {
            data = try Data.init(contentsOf: fileURL)
        } catch {
            fatalError("contents not found: \(error)")
        }
        
        return data
}
    
}
