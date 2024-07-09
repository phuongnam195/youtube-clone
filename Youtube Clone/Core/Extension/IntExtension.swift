//
//  IntExtension.swift
//  Youtube Clone
//
//  Created by Phuong Nam on 24/6/24.
//

import Foundation

extension Int {
    func formatShort() -> String {
        if (self >= 1_000_000_000) {
            return ((Double)(self) / 1_000_000_000.0).format(1) + " T"
        }
        if (self >= 1_000_000) {
            return ((Double)(self) / 1_000_000.0).format(1) + " Tr"
        }
        if (self >= 1_000) {
            return ((Double)(self) / 1_000.0).format(1) + " N"
        }
        return "\(self)"
    }
}
