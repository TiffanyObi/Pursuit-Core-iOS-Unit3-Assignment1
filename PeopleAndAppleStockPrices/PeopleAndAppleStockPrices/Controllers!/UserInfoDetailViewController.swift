//
//  UserInfoDetailViewController.swift
//  PeopleAndAppleStockPrices
//
//  Created by Tiffany Obi on 12/5/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class UserInfoDetailViewController: UIViewController {

    @IBOutlet weak var userimageView: UIImageView!
    
    @IBOutlet weak var genderLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    
    var userInfo: UserInfoData!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    }
    

    func updateUI() {
        
        guard let userDetails = userInfo else {
            fatalError("userinfo is nil. verify prepare for segue.")
        }
        
        genderLabel.text = userDetails.gender.uppercased()
        
        phoneNumberLabel.text = userDetails.cell
        
        emailLabel.text = userDetails.email
    
        ImageClient.fetchImage(for: userDetails.picture.large) { [unowned self] (result) in
        switch result {
            case.failure(let error):
            print("error:\(error)")
            case.success(let image):
        DispatchQueue.main.async {
    self.userimageView.image = image
                    }
                }
            }
        
        }
        
    }
        
    
    

