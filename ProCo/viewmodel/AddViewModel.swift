//
//  AddViewModel.swift
//  ProCo
//
//  Created by Anastasia on 14/6/24.
//

import Foundation

final class AddViewModel: ObservableObject {
    private let goalRepository: GoalRepository
    private let inputRepository: InputRepository
    
    @Published var goal: Float = 0.0
    //@Published var savedItem
    @Published var input: InputEntity = InputEntity(id: 0, input: 0.0, time: "")
    
    @Published var goalData = GoalDataEntity(goal: 0.0, current: 0.0)
    
    init(
        goalRepository: GoalRepository = LiveGoalRepository.shared,
        inputRepository: InputRepository = LiveInputRepository.shared
    ) {
        self.goalRepository = goalRepository
        self.inputRepository = inputRepository
    }
    
    func addGoal() {
        goalRepository.addGoalData(goalData: goalData)
    }
    
    func onGoalAmountChanged(amount: Float) {
        goalData.goal = amount
    }
    
    func addInput() {
        inputRepository.addInput(input: input)
    }
    
    func onInputAmountChanged(amount: Float) {
        input.id = UUID().hashValue
        input.input = amount
        input.time = formattedDate
    }
}
