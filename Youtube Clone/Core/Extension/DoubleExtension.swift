//
//  DoubleExtension.swift
//  Youtube Clone
//
//  Created by Phuong Nam on 4/7/24.
//

import Foundation

extension Double {
    func format(_ decimalPlaces: Int = 2, _ trimTrailingZeros: Bool = true) -> String {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = decimalPlaces
        formatter.maximumFractionDigits = decimalPlaces
        if trimTrailingZeros {
            formatter.minimumFractionDigits = 0
        }
        formatter.roundingMode = .halfUp
        
        let formattedString = formatter.string(from: NSNumber(value: self))
        
        return formattedString ?? "\(self)"
    }
}
