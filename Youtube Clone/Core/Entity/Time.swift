//
//  Time.swift
//  Youtube Clone
//
//  Created by Phuong Nam on 24/6/24.
//

import Foundation

struct Time {
    let hour: Int
    let minute: Int
    let second: Int
    
    init(_ hour: Int, _ minute: Int = 0, _ second: Int = 0) {
        let seconds = hour * 3600 + minute * 60 + second
        self.init(fromSeconds: seconds)
    }
    
    init(fromSeconds seconds: Int = 0) {
        var (q, r) = seconds.quotientAndRemainder(dividingBy: 3600)
        self.hour = q
        (q, r) = r.quotientAndRemainder(dividingBy: 60)
        self.minute = q
        self.second = r
    }
    
    func formatHMMSS() -> String {
        return "\(hour)" + ":" + "\(minute)".padLeft(2, "0") + ":" + "\(second)".padLeft(2, "0")
    }
    
    func formatMSS() -> String {
        return "\(hour * 60 + minute)" + ":" + "\(second)".padLeft(2, "0")
    }
    
    func formatShort() -> String {
        if hour == 0 {
            return formatMSS()
        }
        return formatHMMSS()
    }
}
