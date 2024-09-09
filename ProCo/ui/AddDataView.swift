//
//  AddDataView.swift
//  ProCo
//
//  Created by Anastasia on 14/6/24.
//

import SwiftUI

struct AddDataView: View {
    let screenType: ScreenType
    
    @StateObject var viewModel: AddViewModel
    
    var body: some View {
        ScaffoldView(title: screenType.title, view: addDataView)
    }
    
    var addDataView: some View {
        VStack(alignment: .center) {
            TextField(
                "",
                value: $viewModel.goal,
                format: .number
            )
            .padding(.XL)
            .font(.system(size: 36, weight: .bold, design: .rounded))
            .foregroundColor(.white)
            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .center)
            
            Text(
                "grams"
            )
            .padding(.XS)
            
            if screenType == ScreenType.AddGoal {
                Text(
                    "per day"
                )
                .padding()
            }
            ProCoButton(
                action: { /* to do */ },
                string: "save"
            )
            .padding(.XS)
            
            ProCoTextButton(
                action: { /* to do */ },
                string: "cancel"
            )
        }
        .padding()
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    AddDataView(screenType: ScreenType.AddGoal, viewModel: .init())
}
