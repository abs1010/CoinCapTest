//
//  CoinDataProvider.swift
//  CoinCapTest
//
//  Created by Alan Silva on 08/02/20.
//  Copyright © 2020 Alan Silva. All rights reserved.
//

import Foundation

let BASE_URL : String = "https://api.coincap.io/v2/assets"

enum CoinError: Error{
    case noDataAvailable
    case canNotProccessData
}

class CoinDataProvider {
    
    func getCoinData(completion: @escaping(Result<CoinData, CoinError>) -> Void) {
        
        guard let resourceURL = URL(string: BASE_URL) else { return }

        URLSession.shared.dataTask(with: resourceURL) { (data, response, error) in

            guard let jsonData = data else {
                
                completion(.failure(.noDataAvailable))
                
                return
                
            }

            do {
                let decode = JSONDecoder()
                let json = try decode.decode(CoinData.self, from: jsonData)
            
                completion(.success(json))
 
            }
            catch {
                print(error)
                completion(.failure(.canNotProccessData))
            }

        }.resume()
        
    }
    
}
