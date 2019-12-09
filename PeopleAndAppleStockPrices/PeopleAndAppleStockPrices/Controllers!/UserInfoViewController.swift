//
//  ViewController.swift
//  PeopleAndAppleStockPrices
//
//  Created by Alex Paul on 12/7/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class UserInfoViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    @IBOutlet weak var fullNameSearchBar: UISearchBar!
    
    var allUsers = [UserInfoData]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    var searchQuery = "" {
        didSet {
            let data = readRawJSONData(filename: "userinfo", ext: "json")
            
            
            allUsers = AllUserInfoData.getUserInfo(from: data).filter {
               
                let fullName = "\($0.name.first) \($0.name.last)"
                return fullName.uppercased().contains(searchQuery.uppercased())
            }
        }
    }
    
    func loadData() {
        let data = readRawJSONData(filename: "userinfo", ext: "json")
        allUsers = AllUserInfoData.getUserInfo(from: data)
        
    }
    
  override func viewDidLoad() {
    super.viewDidLoad()
    loadData()
    tableView.dataSource = self
    fullNameSearchBar.delegate = self
    view.backgroundColor = .systemPink
  }

        
    func readRawJSONData(filename: String, ext: String) -> Data {
        
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

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let userDetails = segue.destination as? UserInfoDetailViewController,
        
            let indexPath = tableView.indexPathForSelectedRow else {
                fatalError("verify class name in the Indentity Inspector")
        }
        
        let user = allUsers[indexPath.row]
        
        userDetails.userInfo = user
        
    }

}


extension UserInfoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        allUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let userInfoCell = tableView.dequeueReusableCell(withIdentifier: "userInfoCell", for: indexPath)
        
        let user = allUsers[indexPath.row]
        
        userInfoCell.textLabel?.text = "\(user.name.first.uppercased()) \(user.name.last.uppercased())"
        
        userInfoCell.detailTextLabel?.text = "\(user.location.street) \n \(user.location.city), \(user.location.state)"
        
        userInfoCell.backgroundColor = .yellow
        return userInfoCell
    }
    
    
    
}

extension UserInfoViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
       
        guard !searchText.isEmpty else {
            
            loadData()
            return
        }
        
        searchQuery = searchText
        
        
    }
}
