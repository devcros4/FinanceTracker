//
//  HomeView.swift
//  Financetracker
//
//  Created by jean-baptiste delcros on 23/10/2022.
//

import SwiftUI

struct HomeView: View {
    
    @State private var isPresentingNewAccountScreen = false
    @StateObject private var accounts = AccountList()
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                VStack(spacing: 8) {
                    Text("Solde totale: ")
                    Text("\(String(format: "%.2f \(Currency.euro.rawValue)", accounts.accounts.map { $0.initialAmount }.reduce(0, +)))")
                        .font(.system(size: 32, weight: .bold))
                }
                
                AccentButton(title: "+ Account", color: Color("orange")) {
                    isPresentingNewAccountScreen = true
                }
                VStack(alignment: .leading) {
                    Text("Mes comptes")
                        .font(.title2)
                        .bold()
                    if accounts.accounts.count > 0 {
                        VStack(spacing: 16) {
                            ForEach(accounts.accounts) { account in
                                AccountCell(account: account)
                            }
                        }
                        
                    } else {
                        Text("Ajoutez un compte")
                            .padding(32)
                            .frame(maxWidth: .infinity)
                    }
                }
            }
            .padding(24)
        }
        .background(Color("grey"))
        .sheet(isPresented: $isPresentingNewAccountScreen) {
            AccountCreatorView { account in
                accounts.accounts.append(account)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            
    }
}
