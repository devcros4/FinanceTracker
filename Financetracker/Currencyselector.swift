//
//  Currencyselector.swift
//  Financetracker
//
//  Created by jean-baptiste delcros on 25/10/2022.
//

import SwiftUI

struct Currencyselector: View {
    
    private let currencies = Currency.allCases
    @Binding var selectedCurrency: Currency
    @State private var isSelectedMode = false
    var body: some View {
        ZStack {
            ForEach(currencies.indices) { index in
                Image(systemName: currencies[index] == selectedCurrency ? currencies[index].filledIconName : currencies[index].iconName)
                    .font(.system(size: 32))
                    .offset(x: isSelectedMode ? -CGFloat(index) * 40 : 0)
                    .opacity(currencies[index] == selectedCurrency || isSelectedMode ? 1 : 0)
                    .onTapGesture {
                        if isSelectedMode {
                            selectedCurrency = currencies[index]
                        }
                        withAnimation(.easeInOut(duration: 0.2)) {
                            isSelectedMode.toggle()
                        }
                    }
            }
        }
    }
}

struct Currencyselector_Previews: PreviewProvider {
    @State static var previewSelectedCurrency: Currency = .euro
    static var previews: some View {
        Currencyselector(selectedCurrency: $previewSelectedCurrency)
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
