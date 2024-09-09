//
//  DashboardView.swift
//  ProCo
//
//  Created by Anastasia on 30/5/24.
//

import SwiftUI

struct DashboardView: View {
    @StateObject var viewModel: DashboardViewModel
    
    var body: some View {
        ScaffoldView(title: "Today's goal", view: dashView)
    }
    
    var dashView: some View {
        VStack {
            ProgressBarView(
                goal: viewModel.goal,
                current: viewModel.current,
                goalText: "",
                onClick: { /* to do */ }
            )
        }
        .padding(.M)
    }
}

#Preview {
    DashboardView(viewModel: .init())
}
