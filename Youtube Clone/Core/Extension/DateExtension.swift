//
//  DateExtension.swift
//  Youtube Clone
//
//  Created by Phuong Nam on 24/6/24.
//

import Foundation

extension Date {
    static func from(_ year: Int, _ month: Int = 1, _ day: Int = 1, _ hour: Int = 0, _ minute: Int = 0, _ second: Int = 0) -> Date {
        let gregorianCalendar = NSCalendar(calendarIdentifier: .gregorian)!
        
        var components = DateComponents()
        components.year = year
        components.month = month
        components.day = day
        components.hour = hour
        components.minute = minute
        components.second = second
        
        let date = gregorianCalendar.date(from: components)!
        return date
    }
    
    static func fromServer(_ nilDateString: String?) -> Date {
        if let dateString = nilDateString {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
            if let date = formatter.date(from: dateString) {
                return date
            }
        }
        return Date()
    }
    
    func formatShort() -> String {
        let now = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: self, to: now)
        
        if let years = components.year, years > 0 {
            return String(localized: "\(years) years ago")
        } else if let months = components.month, months > 0 {
            return String(localized: "\(months) months ago")
        } else if let days = components.day, days > 0 {
            return String(localized: "\(days) days ago")
        } else if let hours = components.hour, hours > 0 {
            return String(localized: "\(hours) hours ago")
        } else if let minutes = components.minute, minutes > 0 {
            return String(localized: "\(minutes) minutes ago")
        } else if let seconds = components.second, seconds > 0 {
            return String(localized: "\(seconds) seconds ago")
        }
        
        return ""
    }
}
