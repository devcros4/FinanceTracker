//
//  AccountCell.swift
//  Financetracker
//
//  Created by jean-baptiste delcros on 24/10/2022.
//

import SwiftUI

struct AccountCell: View {
    
    let account: Account
    @State var isFavourite: Bool = false
    
    var body: some View {
        HStack {
            Image(account.iconName)
                .resizable()
                .padding(4)
                .frame(width: 50, height: 50)
            VStack(alignment: .leading, spacing: 4) {
                Text(account.name)
                    .font(.headline)
                    .foregroundColor(.primary)
                Text("Solde: \(String(format: "%.2f \(account.currency.rawValue)", account.amount))")
                    .font(.footnote)
                    .foregroundColor(Color(white: 0.4))
            }
            Spacer()
            Button {
                isFavourite.toggle()
            } label: {
                Image(systemName: isFavourite ? "star.fill" : "star")
                    .foregroundColor(isFavourite ? .yellow : Color(white: 0.4))
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color.white)
        .cornerRadius(16)
    }
}

struct AccountCell_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            AccountCell(account: Account(iconName: "icon_001", name: "Paypal", currency: .euro, initialAmount: 100.23, transactions: [previewTransaction[0]]))
            AccountCell(account: Account(iconName: "icon_002", name: "Paypal", currency: .euro, initialAmount: 100.23, transactions: [previewTransaction[0]]))
            AccountCell(account: Account(iconName: "icon_003", name: "Paypal", currency: .euro, initialAmount: 100.23, transactions: [previewTransaction[0]]))
        }
        .padding()
        .background(Color("grey"))
        .previewLayout(.sizeThatFits)
    }
}
