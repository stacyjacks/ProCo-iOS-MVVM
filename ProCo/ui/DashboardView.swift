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
        NavigationStack {
            ScaffoldView(title: "Today's goal", view: dashView)
        }
    }
    
    var dashView: some View {
        VStack {
            NavigationLink {
                AddDataView(
                    screenType: ScreenType.AddGoal,
                    viewModel: .init(),
                    completion: viewModel.getGoalData
                )
            } label: {
                ProgressBarView(
                    goal: viewModel.goal,
                    current: viewModel.current,
                    goalText: ""
                )
            }
            .frame(alignment: .top)
            .foregroundColor(.black)
            
            HStack {
                ForEach(viewModel.input, id: \.self) { entry in
                    Text(String(entry.input))
                }
            }
            .padding(.S)
            
            HStack {
                NavigationLink {
                    AddDataView(
                        screenType: ScreenType.AddInput,
                        viewModel: .init(), 
                        completion: viewModel.getCurrentInput
                    )
                } label: {
                    ProCoButtonNav(string: "plus")
                }
                .frame(maxHeight: .infinity, alignment: .bottom)
                
                ProCoButton(
                    action: {
                        viewModel.resetDailyData()
                    },
                    icon: "trash.fill"
                )
                .frame(maxHeight: .infinity, alignment: .bottom)
            }
        }
        .frame(maxHeight: .infinity, alignment: .topLeading)
        .padding(.M)
    }
}

#Preview {
    DashboardView(viewModel: .init())
}
