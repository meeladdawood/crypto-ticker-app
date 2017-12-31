//
//  2ndViewController.swift
//  BitcoinTicker
//
//  Created by Meelad Dawood on 12/31/17.
//  Copyright © 2017 London App Brewery. All rights reserved.
//

import Foundation
import UIKit

class secondViewController : UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    let cryptos = ["btc","bch","ltc","eth","dash","xrp","xmr"]
    
    let cryptoNames = ["Bitcoin","Bitcoin Cash","Litecoin","Ethereum","Dash","Ripple","Monero"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cryptos.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! CustomTableViewCell
        
        cell.cellView.layer.cornerRadius = cell.cellView.frame.height / 2
        
        cell.cryptoLabel.text = cryptoNames[indexPath.row]
        cell.cryptoImage.image = UIImage(named: cryptos[indexPath.row])
        cell.cryptoImage.layer.cornerRadius = cell.cryptoImage.frame.height / 2
        
        return cell
    }
    
    
    
}
