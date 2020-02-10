//
//  CoinViewCell.swift
//  CoinCapTest
//
//  Created by Alan Silva on 09/02/20.
//  Copyright © 2020 Alan Silva. All rights reserved.
//

import UIKit

class CoinViewCell: UITableViewCell {
    
    @IBOutlet weak var coinImageView: UIImageView!
    @IBOutlet weak var coinName: UILabel!
    @IBOutlet weak var coinSymbol: UILabel!
    @IBOutlet weak var coinValue: UILabel!
    @IBOutlet weak var coinPercent: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }
    
    func setupCell(for coin: Coin?) {
        
        if let selectedCoin = coin {
            
            let upperImg = selectedCoin.symbol?.lowercased()
            self.coinImageView.image = UIImage(named: upperImg ?? "logo")

            self.coinName.text = selectedCoin.name
            self.coinSymbol.text = selectedCoin.symbol
            
            if let price = Double(selectedCoin.priceUsd!) {
                
                let formatter = NumberFormatter()
                formatter.locale = Locale.autoupdatingCurrent
                formatter.numberStyle = .decimal
                if let formattedPrice = formatter.string(from: Double(round(100*price)/100) as NSNumber) {
                    self.coinValue.text = "$\(formattedPrice)"
                }
                
            }
            
            if let changePercent = Double(selectedCoin.changePercent24Hr!) {
            
                if changePercent < 0 {
                    self.coinPercent.textColor = .red
                    self.coinPercent.text = "\(Double(round(100*changePercent)/100))%"
                }
                else {
                    self.coinPercent.textColor = .systemGreen
                    self.coinPercent.text = "+\(Double(round(100*changePercent)/100))%"
                }
                
            }
        }
        
    }
    
}
