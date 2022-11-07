//
//  Transaction.swift
//  Financetracker
//
//  Created by jean-baptiste delcros on 29/10/2022.
//

import Foundation

struct Transaction: Identifiable {
    let id = UUID()
    let label: String
    let amount: Float
    let currency: Currency
    let date: Date
    
}
