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
    
    func toCryptoModel() -> CryptoModel{
        return CryptoModel(cryptoDTO: self)
    }
}


