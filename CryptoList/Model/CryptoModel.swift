//
//  CryptoModel.swift
//  CryptoList
//
//  Created by gonzalo trujillo vallejo on 31/1/23.
//

import Foundation

struct CryptoModel {
    let id: String
    let symbol: String
    let name: String
    let price: Double
    let image: String
    
    init(cryptoDTO: CryptoDTO) {
        self.id = cryptoDTO.id
        self.symbol = cryptoDTO.symbol
        self.name = cryptoDTO.name
        self.price = cryptoDTO.current_price
        self.image = cryptoDTO.image
    }
}
