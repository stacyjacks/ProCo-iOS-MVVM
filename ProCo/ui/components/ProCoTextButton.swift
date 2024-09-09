//
//  ProCoTextButton.swift
//  ProCo
//
//  Created by Anastasia on 9/9/24.
//

import SwiftUI

struct ProCoTextButton: View {
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
        .frame(width: width)
        .foregroundColor(.darkPurple)
    }
}

#Preview {
    ProCoTextButton(
    action: {}, string: "cancel")
}
