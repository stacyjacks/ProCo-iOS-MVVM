//
//  AddDataView.swift
//  ProCo
//
//  Created by Anastasia on 14/6/24.
//

import SwiftUI

struct AddDataView: View {
    let screenType: ScreenType
    @SwiftUI.Environment(\.dismiss) private var dismiss
    @StateObject var viewModel: AddViewModel
    var completion: () -> Void
    
    var body: some View {
        ScaffoldView(title: screenType.title, view: addDataView)
    }
    
    var addDataView: some View {
        VStack(alignment: .center) {
            TextField(
                "",
                value: getAmount(viewModel: viewModel),
                format: .number
            )
            .onChange(
                of: getAmount(viewModel: viewModel)
                    .wrappedValue, { _, newAmount in
                        switch screenType {
                        case .AddGoal:
                            viewModel.onGoalAmountChanged(amount: newAmount)
                        case .AddSaved:
                            viewModel.onGoalAmountChanged(amount: newAmount) // to do saved
                        case .AddInput:
                            viewModel.onInputAmountChanged(amount: newAmount)
                    }
                }
            )
            .multilineTextAlignment(.center)
            .padding(.XL)
            .font(.system(size: 36, weight: .bold, design: .rounded))
            .foregroundColor(.white)
            
            Text(
                "grams"
            )
            .padding(.XS)
            
            if screenType == ScreenType.AddGoal {
                Text("perDay")
                    .padding()
            }
            ProCoButton(
                action: { 
                    switch screenType {
                    case .AddGoal:
                        viewModel.addGoal()
                        dismiss()
                    case .AddSaved:
                        viewModel.addGoal() // to do saved
                    case .AddInput:
                        viewModel.addInput()
                        dismiss()
                    }
                    completion()
                },
                string: "save"
            )
            .padding(.XS)
            
            ProCoTextButton(
                action: { dismiss() },
                string: "cancel"
            )
        }
        .padding()
        .frame(maxWidth: .infinity)
    }
    
    private func getAmount(viewModel: AddViewModel) -> Binding<Float> {
        switch screenType {
        case .AddGoal:
            $viewModel.goal
        case .AddSaved:
            $viewModel.goal // to do saved
        case .AddInput:
            $viewModel.input.input
        }

    }
}

#Preview {
    AddDataView(screenType: ScreenType.AddGoal, viewModel: .init(), completion: {})
}
