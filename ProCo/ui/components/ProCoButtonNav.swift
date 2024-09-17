//
//  ProCoButtonNav.swift
//  ProCo
//
//  Created by Anastasia on 16/9/24.
//

import SwiftUI

struct ProCoButtonNav: View {
    var string: String? = nil
    var icon: String? = nil
    var width: CGFloat? = .infinity
    
    var body: some View {
        if string != nil {
            Text(LocalizedStringKey(string!))
                .padding(.XS)
                .bold()
                .frame(maxWidth: width)
                .foregroundColor(.white)
                .background(Color.darkPurple)
                .cornerRadius(.S)
        } else {
            Image(systemName: icon!)
                .padding(.XS)
        }
    }
}

#Preview {
    ProCoButtonNav(string: "plus")
}
