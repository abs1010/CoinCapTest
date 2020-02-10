//
//  ViewController.swift
//  CoinCapTest
//
//  Created by Alan Silva on 08/02/20.
//  Copyright © 2020 Alan Silva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let controller : CoinController = CoinController()
    
    @IBOutlet weak var coinsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.controller.delegate = self
        self.controller.setupController()
        
        //DataSource and Delegate of UITableView
        self.coinsTableView.delegate = self
        self.coinsTableView.dataSource = self
        
        //Register Cell
        //self.coinsTableView.register(UINib(nibName: "coinCell2", bundle: nil), forCellReuseIdentifier: "coinCell2")
        
    }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToDetais" {
  
            if let vc: CoinDetailsViewController = segue.destination as? CoinDetailsViewController {
                
                if let indexPath = self.coinsTableView.indexPathForSelectedRow {
                    vc.selectedCoin = self.controller.loadCoin(indexPath: indexPath)
                }
                
            }
            
        }
        
    }

}

//MARK: - EXT DELEGATE AND DATASOURCE (TABLEVIEW)
extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.controller.getNumberOfRowsInSection()
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : CoinViewCell = tableView.dequeueReusableCell(withIdentifier: "coinCell") as! CoinViewCell
        
        cell.setupCell(for: self.controller.loadCoin(indexPath: indexPath))
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        performSegue(withIdentifier: "goToDetais", sender: self)
        
    }
    
}

//MARK: - EXT COINCONTROLLER

extension ViewController : CoinControllerDelegate {
    func successOnRetrievingData(coinData: [Coin]) {
        
        DispatchQueue.main.async {

            self.coinsTableView.reloadData()

        }
        
    }
    
    func errorOnRetrievingData(error: CoinError) {
        
        print("Erro \(error.localizedDescription)")
        
    }
    
}
