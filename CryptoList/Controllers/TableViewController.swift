//
//  TableViewController.swift
//  CryptoList
//
//  Created by gonzalo trujillo vallejo on 31/1/23.
//

import UIKit


class TableViewController: UITableViewController, UISearchResultsUpdating {

    //Lista de CryptoMonedas
    var cryptoCurrencyList =  [CryptoModel]()
    
    //Array donde se van a guardar los resultados encontrados en la lista de cryptomonedas
    var filteredCryptoCurrencyList = [CryptoModel]()
    
    let cryptoManager = CryptoManager()
    //Instancia de la barra de búsqueda
    let searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        cryptoManager.fetchCrypto { [self] cryptoData in
            self.cryptoCurrencyList = cryptoData
            self.filteredCryptoCurrencyList = cryptoData
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        tableView.register(UINib(nibName: CryptoCell.identifier, bundle: nil), forCellReuseIdentifier: CryptoCell.identifier)
        
        // Configurar la barra de búsqueda
        // Asigna la clase como el delegado encargado de actualizar los resultados de búsqueda
        searchController.searchResultsUpdater = self

        // Establece que el fondo detrás del controlador de búsqueda no se oscurecerá durante la presentación
        searchController.obscuresBackgroundDuringPresentation = false

        // Establece el texto placeholder que aparecerá en la barra de búsqueda
        searchController.searchBar.placeholder = "Buscar CryptoMonedas"

        // Asigna el controlador de búsqueda al elemento de navegación
        navigationItem.searchController = searchController

        // Especifica que el contexto de presentación se define en esta clase
        definesPresentationContext = true
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredCryptoCurrencyList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoCell", for: indexPath) as! CryptoCell
        
        let cryptoCurrency = filteredCryptoCurrencyList[indexPath.row]
        
        cell.cryptoNameLabel?.text = cryptoCurrency.name
        cell.cryptoPriceLabel?.text = "\(String(cryptoCurrency.price)) €"
        
        if let imageURL = URL(string: cryptoCurrency.image) {
            DispatchQueue.global().async {
                if let imageData = try? Data(contentsOf: imageURL) {
                    DispatchQueue.main.async {
                        cell.cryptoImage?.image = UIImage(data: imageData)
                    }
                }
            }
        }
        
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text, !searchText.isEmpty {
            filteredCryptoCurrencyList = cryptoCurrencyList.filter { (crypto: CryptoModel) -> Bool in
                return crypto.name.lowercased().contains(searchText.lowercased())
            }
        } else {
            filteredCryptoCurrencyList = cryptoCurrencyList
        }
        
        self.tableView.reloadData()
    }

}

