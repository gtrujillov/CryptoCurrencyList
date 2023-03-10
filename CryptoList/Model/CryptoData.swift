//
//  DataModel.swift
//  CryptoList
//
//  Created by gonzalo trujillo vallejo on 31/1/23.
//

import Foundation

struct  CryptoDTO: Decodable{
    let id: String
    let symbol: String
    let name: String
    let current_price: Double
    let image: String
    let price_change_24h: Double
    let total_volume : Double
    let high_24h : Double
    let low_24h : Double
     
    
    func toCryptoModel() -> CryptoModel{
        return CryptoModel(cryptoDTO: self)
    }
}


