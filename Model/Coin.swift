//
//  Coin.swift
//  CoinCapTest
//
//  Created by Alan Silva on 08/02/20.
//  Copyright © 2020 Alan Silva. All rights reserved.
//

import Foundation

struct CoinData : Codable {
    
    let data : [Coin]?
    let timestamp: Int?
}

struct Coin: Codable {
    
    var id : String?
    var rank : String?
    var symbol : String?
    var name : String?
    var supply : String?
    var maxSupply : String?
    var marketCapUsd : String?
    var volumeUsd24Hr : String?
    var priceUsd : String?
    var changePercent24Hr : String?
    var wrap24Hr : String?
    
}
