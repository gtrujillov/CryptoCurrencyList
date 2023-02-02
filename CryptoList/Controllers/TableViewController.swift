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
    
    let cryptoCell = CryptoCell()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cryptoManager.fetchCrypto { [self] cryptoData in
            self.cryptoCurrencyList = cryptoData
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        tableView.register(UINib(nibName: cryptoCell.identifier, bundle: nil), forCellReuseIdentifier: cryptoCell.identifier)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cryptoCurrencyList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoCell", for: indexPath) as! CryptoCell
        
        let cryptoCurrency = cryptoCurrencyList[indexPath.row]
        
        cell.cryptoNameLabel?.text = cryptoCurrency.name
        cell.cryptoPriceLabel?.text = String(cryptoCurrency.price)
        
        if let imageURL = URL(string: cryptoCurrency.image) {
            DispatchQueue.global().async {
                if let imageData = try? Data(contentsOf: imageURL) {
                    DispatchQueue.main.async {
                        cell.imageView?.image = UIImage(data: imageData)
                    }
                }
            }
        }
        
        return cell
        
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Crypto Currecy List"
    }
    
}

