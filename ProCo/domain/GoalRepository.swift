//
//  GoalRepository.swift
//  ProCo
//
//  Created by Anastasia on 16/9/24.
//

import Foundation

protocol GoalRepository {
    func getGoalData() -> GoalDataEntity
    func addGoalData(goalData: GoalDataEntity)
    func updateCurrent()
    func resetCurrent()
}
