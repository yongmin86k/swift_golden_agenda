//
//  DateExtensions.swift
//  golden_agenda
//
//  Created by Yongmin Kim on 2024-06-26.
//
//  ref: https://vikramios.medium.com/date-handling-in-swift-with-date-extensions-9642cbd76720

import Foundation

extension Date {
    func addingDays(_ days: Int) -> Date {
        return Calendar.current.date(byAdding: .day, value: days, to: self)!
    }
}
