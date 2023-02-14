//
//  CurrencyLogic.swift
//  CurrencyConverter
//
//  Created by Dan Kolan on 2/13/23.
//

import Foundation

struct CurrencyLogic {
    
    mutating func convertToEuro(_ amount: Double) -> Double {
        let euroMultiplier : Double = 0.93162
        let euros = amount * euroMultiplier
        return round(100.0 * euros) / 100.0
    }
    
    mutating func convertToSterling(_ amount: Double) -> Double {
        let sterlingMultiplier : Double = 0.82340
        let sterling = amount * sterlingMultiplier
        return round(100.0 * sterling) / 100.0
    }
    
    mutating func convertToJapaneseYen(_ amount: Double) -> Double {
        let japaneseYenMultiplier : Double = 132.05
        let yen = amount * japaneseYenMultiplier
        return round(100.0 * yen) / 100.0
    }
    
    mutating func convertToCanadian(_ amount: Double) -> Double {
        let canadianMultiplier : Double = 1.3333
        let canadianDollar = amount * canadianMultiplier
        return round(100.0 * canadianDollar) / 100.0
    }
}
