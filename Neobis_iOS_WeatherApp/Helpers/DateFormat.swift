//
//  DateFormat.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Тагай Абдылдаев on 2/5/23.
//

import Foundation


class DateFormat {
    
    static let shared = DateFormat()
    
    func currentDate() -> String {
        let calendar = Calendar.current
        let day = calendar.component(.day, from: Date())
        let month = calendar.component(.month, from: Date())
        let year = calendar.component(.year, from: Date())
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US")
        let mothnName = dateFormatter.monthSymbols[month - 1]
        return "Today, \(day) \(mothnName), \(year)"
    }
    func nextDate(day: Int) -> String {
        let calendar = Calendar.current
        let today = Date()
        guard let nextDate = calendar.date(byAdding: .day, value: day, to: today) else {return ""}
        let weekDay = calendar.component(.weekday, from: nextDate)
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US")
        let weekDayName = dateFormatter.weekdaySymbols[weekDay - 1]
        return weekDayName
    }
}
