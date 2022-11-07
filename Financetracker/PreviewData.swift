//
//  PreviewData.swift
//  Financetracker
//
//  Created by jean-baptiste delcros on 25/10/2022.
//

import Foundation

let previewAccounts = [
    Account(iconName: "icon_001", name: "Caisse d'épargne", currency: .euro, initialAmount: 1234.23, transactions: Array(previewTransaction[0...2])),
    Account(iconName: "icon_002", name: "Paypal", currency: .euro, initialAmount: 6234.23, transactions: [previewTransaction[0]]),
    Account(iconName: "icon_003", name: "Uber", currency: .euro, initialAmount: 324.23, transactions: [previewTransaction[0]])
]

let previewTransaction = [
    Transaction(label: "Loyer", amount: 1200.22, currency: .euro, date: Date()),
    Transaction(label: "Café", amount: 3.22, currency: .euro, date: Date()),
    Transaction(label: "Ticket", amount: 12.22, currency: .euro, date: Date())
    
]
