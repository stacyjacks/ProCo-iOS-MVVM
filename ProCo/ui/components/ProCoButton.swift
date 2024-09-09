//
//  ProCoButton.swift
//  ProCo
//
//  Created by Anastasia on 9/9/24.
//

import SwiftUI

struct ProCoButton: View {
    let action: () -> Void
    let string: String
    var width: CGFloat? = .infinity
    
    var body: some View {
        Button(
            action: { action() },
            label: {
                Text(LocalizedStringKey(string))
                    .padding(.XS)
                    .bold()
            }
        )
        .frame(maxWidth: width)
        .foregroundColor(.white)
        .background(Color.darkPurple)
        .cornerRadius(.S)
    }
}

#Preview {
    ProCoButton(action: {}, string: "save")
}
