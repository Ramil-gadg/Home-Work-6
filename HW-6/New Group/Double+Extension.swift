//
//  Double+Extension.swift
//
//

import Foundation

extension Double {
    func toCurrencyString() -> String? {
        let currencyFormatter = NumberFormatter()
        let locale = Locale(identifier: "ru_RU")
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = locale
        currencyFormatter.maximumFractionDigits = 2
        if let number = currencyFormatter.string(from: NSNumber(value: self as Double)) {
            return "\(number.replacingOccurrences(of: ".", with: ","))"
        } else {
            return nil
        }
    }
}
