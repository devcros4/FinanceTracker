//
//  Iconselector.swift
//  Financetracker
//
//  Created by jean-baptiste delcros on 27/10/2022.
//

import SwiftUI

struct Iconselector: View {
    
    @Binding var selectedIcon: String
    
    private let icons = [
        "icon_001",
        "icon_002",
        "icon_003",
        "icon_004",
        "icon_005",
        "icon_006",
        "icon_007"
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(icons, id: \.self) { iconName in
                    Button {
                        selectedIcon = iconName
                    } label: {
                        Circle()
                            .frame(width: 65, height: 65)
                            .foregroundColor(iconName == selectedIcon ? .black : .white)
                            .overlay {
                                Image(iconName)
                                    .resizable()
                                    .renderingMode(.template)
                                    .foregroundColor(iconName == selectedIcon ? .white : .black)
                                    .frame(width: 35, height: 35)
                            }
                    }

                }
            }
            .padding(.horizontal, 16)
        }
    }
}

struct Iconselected_Previews: PreviewProvider {
    
    @State static var previewSelectedIcon = "icon_001"
    
    static var previews: some View {
        Iconselector(selectedIcon: $previewSelectedIcon)
            .padding(.vertical)
            .previewLayout(.sizeThatFits)
            .background(Color("grey"))
    }
}
