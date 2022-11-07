//
//  MainButton.swift
//  Financetracker
//
//  Created by jean-baptiste delcros on 27/10/2022.
//

import SwiftUI

struct MainButton: View {
    
    let title: String
    let action: () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(.black)
                .cornerRadius(.infinity)
        }

    }
}

struct MainButton_Previews: PreviewProvider {
    static var previews: some View {
        MainButton(title: "Preview Button", action: { print("hello")})
    }
}
