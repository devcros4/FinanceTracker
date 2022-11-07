//
//  AccountDetailView.swift
//  Financetracker
//
//  Created by jean-baptiste delcros on 29/10/2022.
//

import SwiftUI

struct AccountDetailView: View {
    let account: Account
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                HStack {
                    Text(account.name)
                        .font(.system(size: 32, weight: .bold))
                    Spacer()
                    Text("\(String(format: "%.2f \(account.currency.rawValue)", account.amount))")
                        .font(.system(size: 32, weight: .light))
                }
                AccentButton(title: "+ transaction", color: Color("purple")) {
                    
                }
                Divider()
                VStack(spacing: 16) {
                    if account.transactions.isEmpty {
                        Text("Aucune transaction pour le moment...")
                            .font(.callout)
                            .foregroundColor(Color(white: 0.4))
                    } else {
                        ForEach(account.transactions) { transaction in
                            TransctionCell(transaction: transaction)
                        }
                    }
                    Text("Solde initial : \(String(format: "%.2f \(account.currency.rawValue)", account.initialAmount))")
                        .font(.callout)
                        .foregroundColor(Color(white: 0.4))
                        .padding()
                }
            }
            .padding()
        }
        .background(Color("grey"))
    }
}

struct AccountDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AccountDetailView(account: previewAccounts[0])
    }
}
