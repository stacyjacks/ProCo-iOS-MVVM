//
//  ProgressBarView.swift
//  ProCo
//
//  Created by Anastasia on 13/6/24.
//

import SwiftUI

struct ProgressBarView: View {
    let goal: Float
    let current: Float
    let goalText: String
    let onClick: () -> Void
    
    var body: some View {
        VStack {
            HStack {
                Text("0")
                ProgressView(value: current, total: goal)
                    .progressViewStyle(ProgressBarViewStyle())
                Text(String(Int(goal.rounded(.down))))
            }
            Text(goalText)
        }
        .padding(.L)
        .frame(maxWidth: .infinity, alignment: .top)
        .background(.white)
        .cornerRadius(25)
    }
}

#Preview {
    VStack {
        ProgressBarView(
            goal: 80.0,
            current: 30,
            goalText: "You're off to a good start!",
            onClick: {}
        )
    }
    .padding(.M)
    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: .top)
    .background(purpleGradient)
}
