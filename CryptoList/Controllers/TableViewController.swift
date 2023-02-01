//
//  TableViewController.swift
//  CryptoList
//
//  Created by gonzalo trujillo vallejo on 31/1/23.
//

import UIKit



class TableViewController: UITableViewController {
    
    //Lista de CryptoMonedas
    var cryptoCurrencyList =  [CryptoModel]()
    
    let cryptoManager = CryptoManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cryptoManager.fetchCrypto { [self] cryptoData in
            self.cryptoCurrencyList = cryptoData
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        tableView.register(CustomCell.self, forCellReuseIdentifier: "CryptoCell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cryptoCurrencyList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomCell
        
        let cryptoCurrency = cryptoCurrencyList[indexPath.row]
        
        if let label = cell.cryptoNameLabel {
            label.text = cryptoCurrency.name
        }
        if let label = cell.cryptoPriceLabel {
            label.text = String(cryptoCurrency.price)
        }
        if let imageURL = URL(string: cryptoCurrency.image) {
            DispatchQueue.global().async {
                if let imageData = try? Data(contentsOf: imageURL) {
                    DispatchQueue.main.async {
                        cell.cryptoImage.image = UIImage(data: imageData)
                    }
                }
            }
        }
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Crypto Currecy List"
    }
    
}

