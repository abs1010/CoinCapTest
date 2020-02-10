//
//  CoinDetailsViewController.swift
//  CoinCapTest
//
//  Created by Alan Silva on 09/02/20.
//  Copyright © 2020 Alan Silva. All rights reserved.
//

import UIKit

class CoinDetailsViewController: UIViewController {
    
    @IBOutlet weak var coinImage: UIImageView!
    @IBOutlet weak var coinName: UILabel!
    @IBOutlet weak var coinMarketCap: UILabel!
    @IBOutlet weak var coinVolumeToday: UILabel!
    @IBOutlet weak var coinAvailableSupply: UILabel!
    @IBOutlet weak var coinPercentChanges: UILabel!
    
    var selectedCoin : Coin? {
        
        didSet {
            
            print("I got a Coin")
            //setupView()
            printSome()
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupView()
    }
    
    func printSome(){
        
        print(selectedCoin?.name)
        
    }
    
    func setupView(){
        
        //  if let selectedCoin = coin {
        
        let upperImg = selectedCoin?.symbol?.lowercased()
        self.coinImage.image = UIImage(named: upperImg ?? "logo")
        
        self.coinName.text = selectedCoin?.name
        self.coinMarketCap.text = selectedCoin?.marketCapUsd
        self.coinVolumeToday.text = selectedCoin?.volumeUsd24Hr
        self.coinPercentChanges.text = selectedCoin?.changePercent24Hr
        
        //        if let price = Double(selectedCoin?.priceUsd) {
        //
        //                let formatter = NumberFormatter()
        //                formatter.locale = Locale.autoupdatingCurrent
        //                formatter.numberStyle = .decimal
        //                if let formattedPrice = formatter.string(from: Double(round(100*price)/100) as NSNumber) {
        //                    self.coinMarketCap.text = "$\(formattedPrice)"
        //                }
        //
        //            }
        //
        //            if let changePercent = Double(selectedCoin?.changePercent24Hr!) {
        //
        //                if changePercent < 0 {
        //                    self.coinPercentChanges.textColor = .red
        //                    self.coinPercentChanges.text = "\(Double(round(100*changePercent)/100))%"
        //                }
        //                else {
        //                    self.coinPercentChanges.textColor = .systemGreen
        //                    self.coinPercentChanges.text = "+\(Double(round(100*changePercent)/100))%"
        //                }
        //
        //           // }
        //
        //        }
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
