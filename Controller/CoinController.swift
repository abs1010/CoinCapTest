//
//  CoinController.swift
//  CoinCapTest
//
//  Created by Alan Silva on 08/02/20.
//  Copyright © 2020 Alan Silva. All rights reserved.
//

import Foundation

protocol CoinControllerDelegate : class {
    func successOnRetrievingData(coinData: [Coin])
    func errorOnRetrievingData(error: CoinError)
}

class CoinController {
    
   private var coinsArray = [Coin]()
    
    var provider : CoinDataProvider?
    
    weak var delegate: CoinControllerDelegate?
    
//MARK: SETUP CONTROLLER
    func setupController(){
        
        self.provider = CoinDataProvider()
        getCoins()
        
    }
    
//MARK: CLOSURE GETCOIN
    private func getCoins(){
        
        self.provider?.getCoinData { [weak self] results in
            
            switch results {
            case .success(let coinData):
                
                guard let coinsArray = coinData.data else { return }
                self?.coinsArray = coinsArray
                self?.delegate?.successOnRetrievingData(coinData: coinsArray)
            case .failure(let coinError):
                print("Problema ao obter os dados das moedas. \(coinError.localizedDescription)")
                self?.delegate?.errorOnRetrievingData(error: coinError)
            }
            
        }
        
    }
    
//MARK: NUMBER OF ROWS IN SECTION
    
    func getNumberOfRowsInSection() -> Int {
        
        return self.coinsArray.count
        
    }

//MARK: LOAD A COIN BY INDEXPATH
    
    func loadCoin(indexPath: IndexPath) -> Coin {
        
        return self.coinsArray[indexPath.row]
        
    }
    
}
