//
//  CryptoManager.swift
//  CryptoList
//
//  Created by gonzalo trujillo vallejo on 31/1/23.
//

import Foundation

class CryptoManager {
    let CryptoURL = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=eur&order=market_cap_desc&per_page=100&page=1&sparkline=false"
    
    func fetchCrypto(completion: ((_ cryptoData: [CryptoModel]) -> Void)?){
        let urlString = CryptoURL
        performRequest(urlString: urlString, completion: completion)
    }
    
    private func performRequest(urlString: String, completion: ((_ cryptoData: [CryptoModel]) -> Void)?){
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { [weak self] data, response, error in
                if error != nil {
                    completion?([CryptoModel]())
                }
                if let data {
                    let models = self?.parseJSON(data) ?? [CryptoModel]()
                    completion?(models)
                }
            }
            task.resume()
        }
    }
    
    private func parseJSON(_ cryptoData: Data) -> [CryptoModel] {
        let decoder = JSONDecoder()
        
        do {
            let decodeData =  try decoder.decode([CryptoDTO].self, from: cryptoData)
            
            return decodeData.map { cryptoDTO in
                return cryptoDTO.toCryptoModel()
            }
            
        } catch  {
            return [CryptoModel]()
        }
    }
    
}
