//
//  AccountCreatorView.swift
//  Financetracker
//
//  Created by jean-baptiste delcros on 25/10/2022.
//

import SwiftUI

struct AccountCreatorView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State private var accountName = ""
    @State private var amount = ""
    @State private var selecetedCurrency: Currency = .euro
    @State private var selectedIcon: String = "icon_001"
    var onAccountCreated: (Account) -> Void
    var body: some View {
        VStack(spacing: 32) {
            VStack(spacing: 16) {
                Text(accountName == "" ? "Nouveau compte" : accountName)
                    .font(.system(size: 32, weight: .bold))
                    .padding(.top, 32)
                Text("Solde : \(String(format: "%.2f", Float(amount) ?? 0.0)) \(selecetedCurrency.rawValue)")
                    .font(.system(size: 20, weight: .light))
                    .foregroundColor(Color(white: 0.4))
            }
            VStack(alignment: .leading) {
                Text("Nom")
                    .font(.title2)
                    .bold()
                TextField("Ex : Paypal", text: $accountName)
                    .submitLabel(.done)
                    .padding(12)
                    .padding(.horizontal, 12)
                    .background(Color.white)
                    .cornerRadius(.infinity)
            }
            VStack(alignment: .leading) {
                Text("Icône")
                    .font(.title2)
                    .bold()
                Iconselector(selectedIcon: $selectedIcon)
                    .padding(.horizontal, -16)
            }
            VStack(alignment: .leading) {
                Text("Solde initial")
                    .font(.title2)
                    .bold()
                HStack {
                    TextField("Ex : 200 \(selecetedCurrency.rawValue)", text: $amount)
                        .padding(12)
                        .padding(.horizontal, 12)
                        .keyboardType(.numbersAndPunctuation)
                        .submitLabel(.done)
                    Currencyselector(selectedCurrency: $selecetedCurrency)
                        .foregroundColor(Color("purple"))
                        .padding(4)
                    
                }
                .background(.white)
                .cornerRadius(.infinity)
                
            }
            Spacer()
            MainButton(title: "Créer") {
                let newAccount = Account(iconName: self.selectedIcon, name: self.accountName, currency: selecetedCurrency, initialAmount: Float(self.amount) ?? 0.0, transactions: [])
                onAccountCreated(newAccount)
                presentationMode.wrappedValue.dismiss()
            }
        }
        .padding()
        .background(Color("grey"))
        
    }
    
}

struct AccountCreatorView_Previews: PreviewProvider {
    static var previews: some View {
        AccountCreatorView(onAccountCreated: {_ in })
    }
}
