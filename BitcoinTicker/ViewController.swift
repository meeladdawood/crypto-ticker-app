//
//  ViewController.swift
//  BitcoinTicker
//
//  Created by Meelad Dawood.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import UIKit


import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    let baseURL = "https://apiv2.bitcoinaverage.com/indices/global/ticker/"
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    let currencySymbolArray = ["$", "R$", "$", "¥", "€", "£", "$", "Rp", "₪", "₹", "¥", "$", "kr", "$", "zł", "lei", "₽", "kr", "$", "$", "R"]
    var finalURL = ""

    //Pre-setup IBOutlets
    @IBOutlet weak var bitcoinPriceLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    @IBOutlet weak var cryptoImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currencyPicker.delegate = self
        currencyPicker.dataSource = self
        
        cryptoImage.image = UIImage(named : cryptos[selectedCoin]) 
        
    }

    
    //TODO: Place your 3 UIPickerView delegate methods here
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencyArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        finalURL = baseURL + cryptos[selectedCoin].uppercased() + currencyArray[row]
        getCryptoData(url: finalURL, row : row)
    }

    
    
    
//    
//    //MARK: - Networking
//    /***************************************************************/
    
    func getCryptoData(url: String, row : Int) {
        
        Alamofire.request(url, method: .get)
            .responseJSON { response in
                if response.result.isSuccess {
                    let cryptoJSON : JSON = JSON(response.result.value!)

                    self.updateCryptoData(json: cryptoJSON , row : row)

                } else {
                    self.bitcoinPriceLabel.text = "Unavaliable"
                }
            }

    }

    
    
    
    
//    //MARK: - JSON Parsing
//    /***************************************************************/
    
    func updateCryptoData(json : JSON ,  row : Int) {
        
        if let priceResult = json["ask"].double {
          bitcoinPriceLabel.text = "\(currencySymbolArray[row])" + String(priceResult)
        }
        
    }
    




}

