//
//  AccountList.swift
//  Financetracker
//
//  Created by jean-baptiste delcros on 29/10/2022.
//

import Foundation

class AccountList: ObservableObject {
    
    @Published var accounts: [Account]
    
    init(accounts: [Account] = []) {
        self.accounts = accounts
    }
    
}
