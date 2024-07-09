//
//  StringExtension.swift
//  Youtube Clone
//
//  Created by Phuong Nam on 24/6/24.
//

import Foundation

extension String {
    func padLeft(_ newLength: Int, _ character: Character) -> String {
        let currentLength = self.count
        if currentLength < newLength {
            return String(repeatElement(character, count: newLength - currentLength)) + self
        } else {
            return self
        }
    }
    
    func firstMatch(pattern: String) -> String? {
        do {
            let regex = try NSRegularExpression(pattern: pattern)
            let nsString = self as NSString
            if let match = regex.firstMatch(in: self, range: NSRange(location: 0, length: nsString.length)) {
                return nsString.substring(with: match.range)
            }
        } catch {
            return nil
        }
        return nil
    }
}

extension String? {
    var isNullOrEmpty: Bool {
        return self?.isEmpty ?? true
    }
}
