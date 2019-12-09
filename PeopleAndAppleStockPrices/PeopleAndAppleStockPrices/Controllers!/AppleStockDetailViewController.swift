//
//  AppleStockDetailViewController.swift
//  PeopleAndAppleStockPrices
//
//  Created by Tiffany Obi on 12/9/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class AppleStockDetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var openingPriceLabel: UILabel!
    
    
    @IBOutlet weak var closingPriceLabel: UILabel!
    
    
    var info: AppleInfo!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    }
    
    func updateUI () {
        
        let stringChange = "\(info.change)"
        if stringChange.hasPrefix("-") {
        imageView.image = UIImage(named: "thumbsDown")
        } else {
            imageView.image = UIImage(named: "thumbsUp")
        }
        
        dateLabel.text = info.label
        
        openingPriceLabel.text = "Opening Price: \(info.uOpen)"
        closingPriceLabel.text = "Closing Price \(info.close)"


}
}
