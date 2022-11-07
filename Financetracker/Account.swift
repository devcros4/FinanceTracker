//
//  Account.swift
//  Financetracker
//
//  Created by jean-baptiste delcros on 24/10/2022.
//

import Foundation

class Account: Identifiable, ObservableObject {
    let id = UUID()
    let iconName: String
    let name: String
    let currency: Currency
    let initialAmount: Float
    let transactions: [Transaction]
    var amount: Float {
        return transactions.map { $0.amount}.reduce(initialAmount, +)
    }
    
    init(iconName: String, name: String, currency: Currency, initialAmount: Float, transactions: [Transaction]) {
        self.iconName = iconName
        self.name = name
        self.currency = currency
        self.initialAmount = initialAmount
        self.transactions = transactions
    }
}
