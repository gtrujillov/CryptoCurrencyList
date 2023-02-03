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
    let priceChanged: Double
    let totalVolume : Double
    let high24h : Double
    let low24h : Double
    
    init(cryptoDTO: CryptoDTO) {
        self.id = cryptoDTO.id
        self.symbol = cryptoDTO.symbol
        self.name = cryptoDTO.name
        self.price = cryptoDTO.current_price
        self.image = cryptoDTO.image
        self.priceChanged = cryptoDTO.price_change_24h
        self.high24h = cryptoDTO.high_24h
        self.low24h = cryptoDTO.low_24h
        self.totalVolume = cryptoDTO.total_volume
    }
}
