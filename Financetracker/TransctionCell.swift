//
//  TransctionCell.swift
//  Financetracker
//
//  Created by jean-baptiste delcros on 29/10/2022.
//

import SwiftUI

struct TransctionCell: View {
    
    let transaction: Transaction
    let dateFormatter: DateFormatter = {
        let dt = DateFormatter()
        dt.dateFormat = "dd/MM/yyyy à HH:mm"
        return dt
    }()
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(transaction.label)
                    .font(.headline)
                Text(dateFormatter.string(from: transaction.date))
                    .font(.footnote)
                    .foregroundColor(Color(white: 0.4))
            }
            Spacer()
            Text(transaction.amount.description)
        }
        .padding()
        .background(.white)
        .cornerRadius(16)
    }
}

struct TransctionCell_Previews: PreviewProvider {
    static var previews: some View {
        TransctionCell(transaction: previewTransaction[0])
            .padding(24)
            .background(Color("grey"))
            .previewLayout(.sizeThatFits)
    }
}
