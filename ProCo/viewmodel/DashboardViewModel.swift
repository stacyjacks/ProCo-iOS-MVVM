//
//  DashboardViewModel.swift
//  ProCo
//
//  Created by Anastasia on 13/6/24.
//

import Foundation

final class DashboardViewModel: ObservableObject {
    private let goalRepository: GoalRepository
    private let inputRepository: InputRepository
    
    @Published var current: Float = 0.0
    @Published var goal: Float = 0.0
    @Published var input: [InputEntity] = []
    
    init(
        goalRepository: LiveGoalRepository = LiveGoalRepository.shared,
        inputRepository: InputRepository = LiveInputRepository.shared
    ) {
        self.goalRepository = goalRepository
        self.inputRepository = inputRepository
        
        getGoalData()
        getCurrentInput()
    }
    
    func getGoalData() {
        goal = goalRepository.getGoalData().goal
        current = goalRepository.getGoalData().current
    }
    
    func getCurrentInput() {
        input = inputRepository.getAllInput()
        current = if input.isEmpty {
            0.0
        } else {
            self.input.map { $0.input }.reduce(0, +)
        }
    }
    
    func resetDailyData() {
        inputRepository.resetAllInput()
        current = 0.0
        input = []
    }
}
